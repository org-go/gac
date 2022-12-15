package redisx

import (
    "context"
    "errors"
    "github.com/go-redis/redis/v8"
    "github.com/spaolacci/murmur3"
    "strconv"
    "time"
)

const (
    maps      = 14

    setScript = `
for _, offset in ipairs(ARGV) do
	redis.call("setbit", KEYS[1], offset, 1)
end
`

    getScript = `
for _, offset in ipairs(ARGV) do
	if tonumber(redis.call("getbit", KEYS[1], offset)) == 0 then
		return false
	end
end
return true
`
)

type (
    Filter struct {
        bits   uint
        bitSet bitSetProvider
    }
    redisBitSet struct {
        ctx context.Context
        store *redis.Client
        key   string
        bits  uint
    }
    bitSetProvider interface {
        check([]uint) (bool, error)
        set(offset []uint) error
        expire(seconds int) error
    }
)



/**
 * $(New)
 * @Description:
 * @param ctx
 * @param store
 * @param key
 * @param bits
 * @return *Filter
 */
func New(ctx context.Context, store *redis.Client, key string, bits uint) *Filter {
    return &Filter{
        bits:   bits,
        bitSet: newRedisBitSet(ctx, store, key, bits),
    }
}

/**
 * $(Add)
 * @Description:
 * @receiver this
 * @param data
 * @return error
 */
func (this *Filter) Add (data []byte) error {

    return this.bitSet.set(this.locations(data))
}

/**
 * $(Exists)
 * @Description:
 * @receiver this
 * @param data
 * @return bool
 * @return error
 */
func (this *Filter) Exists(data []byte) (bool, error) {

    locations := this.locations(data)
    check, err := this.bitSet.check(locations)
    if err != nil || !check {
        return false, err
    }
    return true, nil
}

/**
 * $(Expire)
 * @Description:
 * @receiver this
 * @param seconds
 * @return error
 */
func (this *Filter) Expire(seconds int) error {
    return this.bitSet.expire(seconds)
}




/**
 * $(locations)
 * @Description:
 * @receiver this
 * @param data
 * @return []uint
 */
func (this *Filter) locations(data []byte) []uint {

    locals := make([]uint, maps)
    for i := 0; i < maps; i++ {
        locals[i] = uint(murmur3.Sum64(append(data, byte(i))) % uint64(this.bits))
    }
    return locals
}



/**************************************************************************/


func (self redisBitSet) check(offset []uint) (bool, error) {

    args, err := self.buildOffsetArgs(offset)
    if err != nil {
        return false, err
    }

    val, err := self.store.Eval(self.ctx, getScript, []string{self.key}, args).Int64()
    if err != nil {
        return false, err
    }

    return val == 1, nil
}

func (self redisBitSet) set(offset []uint) error {

    if args, err := self.buildOffsetArgs(offset); err != nil {
        return err
    } else {
        err = self.store.Eval(self.ctx, setScript, []string{self.key}, args).Err()
        if err == redis.Nil {
            return nil
        }
    }
    return nil

}

func (self *redisBitSet) expire(seconds int) error {
    return self.store.Expire(self.ctx, self.key, time.Duration(seconds) * time.Second).Err()
}


func (self *redisBitSet) buildOffsetArgs(offsets []uint) ([]string, error) {
    var args []string

    for _, offset := range offsets {
        if offset >= self.bits {
            return nil, errors.New(`error`)
        }
        args = append(args, strconv.FormatUint(uint64(offset), 10))
    }

    return args, nil
}

func newRedisBitSet(ctx context.Context, store *redis.Client, key string, bits uint) *redisBitSet {
    return &redisBitSet{ctx: ctx, store: store, key: key, bits: bits}
}

