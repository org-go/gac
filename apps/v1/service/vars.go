package service

import (
    "context"
    "encoding/json"
    "fmt"
    dapr "github.com/dapr/go-sdk/client"
    "github.com/go-redis/redis/v8"
    "github.com/hibiken/asynq"
    "go.opentelemetry.io/otel/attribute"
    "payfun.gac.service/apps/errx"
    "payfun.gac.service/apps/meta"
    "payfun.gac.service/apps/meta/contextx"
    v1 "payfun.gac.service/apps/v1"
    "payfun.gac.service/apps/v1/entity/assembler"
    "payfun.gac.service/apps/v1/service/logs"
    "payfun.gac.service/pkg/org.pm.sdk/setting"
)

type Edge struct {
    Ctx context.Context
    AsyncRedis *asynq.Client
    Redis *redis.Client
    Dapr dapr.Client
}


func Initialization() *Edge {
    return &Edge{
        Ctx: context.TODO(),
        AsyncRedis: asynq.NewClient(asynq.RedisClientOpt{Addr: setting.RedisConf.Host, Password: setting.RedisConf.Password, DB: 10}),
        Redis: redis.NewClient(&redis.Options{Addr: setting.RedisConf.Host, Password:setting.RedisConf.Password, DB: 8, ReadTimeout:300e6, WriteTimeout: 300e6}),
        Dapr: v1.Dapr,
    }

}




/**
 * $(GetEdge)
 * @Description:
 * @receiver this
 * @return edge
 * @return err
 */
func (this Edge) GetEdge() (edge meta.MetaEdgeOptions, err error) {

    edgex, ok := this.Ctx.Value(meta.EdgeKey).(meta.MetaEdgeOptions)
    if ok {
        return edgex, nil
    }
    return edgex, fmt.Errorf(`error # {edge} # %v`, this.Ctx)

}

/**
 * $(RKey)
 * @Description:
 * @receiver this
 * @param key
 * @param part
 * @return string
 */
func (this Edge) RKey (key string, part string) string {
    return fmt.Sprintf(key, part)
}


/**
 * $(Chunk)
 * @Description:
 * @receiver this
 * @param length
 * @param count
 * @param fc
 */
func (this Edge) Chunk(length, count int, fc func(offset, size int)) {
    for i := 0; i < length/count; i++ {
        fc(i*count, (i+1)*count)
    }
}

/**
 * $(WithLog)
 * @Description:
 * @receiver this
 * @param ctx
 * @param rfc6749Error
 * @param param
 */
func (this Edge) WithLog(ctx context.Context, rfc6749Error *errx.RFC6749Error, param interface{})  {

    _ = logs.Svc().Add(ctx, func(lx *assembler.AdminLogAssembler) {

        lx.ActionUser = contextx.FromAuthorized(ctx).Name

        rfc6749Error.Log(lx, func() string {
            marshal, _ := json.Marshal(param)
            return string(marshal)

        })
    })

}

/**
 * $(Ot)
 * @Description:
 * @receiver this
 * @param ctx
 * @param m
 * @param name
 * @param opt
 * @return context.Context
 */
func (this Edge) Ot(ctx context.Context, m M, name string, opts ...interface{}) context.Context {

    ctx, span := v1.Tracer.Start(ctx, m())
    span.AddEvent(name)
    if opts != nil {
        s, _ := json.Marshal(opts)
        span.SetAttributes(attribute.String(`condition`, string(s)))
    }
    span.End()
    return ctx

}

type M func() string

func (this Edge) S() string {
    return `service`
}

func (this Edge) R() string {
    return `repo`
}
