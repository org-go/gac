package redisx

import (
    "context"
    "github.com/go-redis/redis/v8"
)

const (
    unlockScript = `
if redis.call("get",KEYS[1]) == ARGV[1] then
    return redis.call("del",KEYS[1])
else
    return 0
end`

)

func Unlock(ctx context.Context, store *redis.Client, key string, args ...string) error {

    return store.Eval(ctx, unlockScript, []string{key}, args).Err()
}
