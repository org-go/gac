package redisx

import (
    "context"
    "encoding/json"
    "github.com/go-redis/redis/v8"
    "github.com/jinzhu/gorm"
    "time"
)

type i18ns struct {
    rds   *redis.Client
    mysql *gorm.DB
    ctx   context.Context
    lang  string
    vok   invoke
    li    i18n
    ls    []i18n
}

type i18n struct {
    Pk          int32     `gorm:"pk" json:"pk"`
    Code        string    `gorm:"code" json:"code"`         // 组合唯一值
    Number      int32     `gorm:"number" json:"number"`     // 数字编码
    Type        string    `gorm:"type" json:"type"`         // 模块属性
    Business    string    `gorm:"business" json:"business"` // 业务模块
    Zh          string    `gorm:"zh" json:"zh"`             // 中
    Ja          string    `gorm:"ja" json:"ja"`             // 日
    En          string    `gorm:"en" json:"en"`             // 英
    Remark      string    `gorm:"remark" json:"remark"`     // 备注
    CreatedTime time.Time `gorm:"created_time" json:"created_time"`
}

func (*i18n) TableName() string {
    return "i18n"
}
func (*i18n) RedisKey() string {
    return `gms:common:i18n`
}

type (
	ILang interface {
        Xls(codes ...string) (text []interface{})
    }

    invoke interface {
        check() bool
        generate(sql func(db *gorm.DB) (tps []interface{})) (err error)
    }
)


func News(ctx context.Context, client *redis.Client, mysql *gorm.DB, lang string) ILang {

    this := i18ns{rds: client, mysql: mysql, ctx: ctx, lang: lang}
    if this.check() == false {
        _ = this.generate(func(db *gorm.DB) (tps []interface{}) {
            _ = this.mysql.Table(this.li.TableName()).Select(`pk, code, number, type, business, zh, ja, en, remark, created_time`).Find(&this.ls).Error
            for _, lang := range this.ls {
                val, _ := json.Marshal(&lang)
                tps = append(tps, lang.Code, string(val))
            }
            return tps
        })
    }
    return this

}

func (this i18ns) check() bool {

    val := this.rds.HGetAll(this.ctx, this.li.RedisKey()).Val()
    return len(val) != 0
}

func (this i18ns) generate(sql func(db *gorm.DB) (tps []interface{})) (err error) {

    return this.rds.HMSet(this.ctx, this.li.RedisKey(), sql(this.mysql)).Err()

}

func (this i18ns) Xls(codes ...string) (text []interface{}) {

    vals := this.rds.HMGet(this.ctx, this.li.RedisKey(), codes...).Val()
    for _, val := range vals {
        lx := i18n{}
        _ = json.Unmarshal([]byte(val.(string)), &lx)
        switch this.lang {
        case `zh`:
            text = append(text, lx.Zh)
        case `en`:
            text = append(text, lx.En)
        case `ja`:
            text = append(text, lx.Ja)
        default:
            text = append(text, lx.Zh)
        }
    }
    return text
}
