package logx

import (
    "context"
    "encoding/json"
    "fmt"
    "github.com/gin-gonic/gin"
    "github.com/wangcheng0509/gpkg/loghelp"
    "go.opentelemetry.io/otel/attribute"
    "go.opentelemetry.io/otel/trace"
    v1 "payfun.gac.service/apps/v1"
    "payfun.gac.service/pkg/org.pm.sdk/setting"
    "strconv"
    "strings"
    "time"
)

var C = getLoggerWitchGinContext
var G = getLoggerWithContext
var flag = setting.AppSetting.Tlog

type (
    logger struct {
        c     *gin.Context
        ctx   *context.Context
        level int
        tag   bool
        tp    string
    }
    CallError func() string
)

func getLoggerWithContext(ctx *context.Context) *logger {

    return &logger{ctx: ctx, tag: flag}
}

func getLoggerWitchGinContext(c *gin.Context) *logger {

    x := c.Request.Context()
    return &logger{c: c, ctx: &x, tag: flag}
}

/**
 * $(V)
 * @Description:
 * @receiver l
 * @param level
 * @return *logger
 */
func (l *logger) V(level int) *logger {
    l.level = level
    return l
}

/**
 * $(Terror)
 * @Description:
 * @receiver logger
 * @param err
 * @param callErrors
 */
func (l logger) Terror(err error, callErrors ...CallError) {
    l.tp = `Terror`
    call := callError(callErrors...)
    l.trace(err, call)
    loghelp.Error(fmt.Sprintf(`{LEVEL}:{%d} --- [TERROR] %s`, l.level, call), err.Error(), true)

}

/**
 * $(Error)
 * @Description:
 * @receiver l
 * @param err
 * @param callErrors
 */
func (l logger) Error(err error, callErrors ...CallError) {
    l.tp = `Error`
    call := callError(callErrors...)
    l.trace(err, call)
    loghelp.Error(fmt.Sprintf(`{LEVEL}:{%d} --- [ERROR] %s`, l.level, call), err.Error(), false)
}

/**
 * $(Info)
 * @Description:
 * @receiver logger
 * @param str
 * @param callErrors
 */
func (l logger) Info(str string, callErrors ...CallError) {
    l.tp = `Info`
    call := callError(callErrors...)
    l.trace(str, call)
    loghelp.Log(fmt.Sprintf(`{LEVEL}:{%d} --- [LOG] %s`, l.level, call), str, false)
}

/**
 * $(Debug)
 * @Description:
 * @receiver logger
 * @param any
 * @param callErrors
 */
func (l logger) Debug(any interface{}, callErrors ...CallError) {

    l.tp = `Debug`
    call := callError(callErrors...)
    marshal, _ := json.Marshal(any)
    l.trace(string(marshal), call)
    loghelp.Log(fmt.Sprintf(`{LEVEL}:{%d}  --- [DEBUG] %s`, l.level, call), string(marshal), false)

}

/**
 * $(callError)
 * @Description:
 * @param callErrors
 * @return string
 */
func callError(callErrors ...CallError) string {

    var str []string
    for _, callError := range callErrors {
        str = append(str, callError())
    }
    return strings.Join(str, "\n")

}

/**
 * $(trace)
 * @Description:
 * @receiver l
 * @param err
 */
func (l logger) trace(err interface{}, ps string) {

    if l.tag {
        _, span := v1.Tracer.Start(*l.ctx, `log.`+l.tp)
        span.RecordError(fmt.Errorf(`%v`, err), trace.WithTimestamp(time.Now()))
        span.SetAttributes(attribute.StringSlice(`error_type`, []string{l.tp, strconv.Itoa(l.level)}))
        span.SetAttributes(attribute.StringSlice(`error_record`, []string{`title`, ps}))
        span.End()
    }
}
