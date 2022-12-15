package faas

import (
    "context"
    "encoding/json"
    dapr "github.com/dapr/go-sdk/client"
    v1 "payfun.gac.service/apps/v1"
    "payfun.gac.service/pkg/org.pm.sdk/logx"
)


/**
 * $(UploadFile)
 * @Description:
 * @receiver this
 * @param ctx
 * @param opts
 * @return links
 * @return err
 */
func (this faasService) UploadFile(ctx context.Context, opt SsoSourceReqs) (links []interface{}, err error) {

    links, err = this.dial(ctx, opt, `faas/v1/globe/sso/upload`)

    return links, err

}


/**
 * $(dial)
 * @Description:
 * @receiver this
 * @param ctx
 * @param opt
 * @param service
 * @return reply
 * @return err
 */
func (this faasService) dial(ctx context.Context, opt interface{}, service string) (reply []interface{}, err error) {

    var lx map[string]interface{}
    str, _ := json.Marshal(&opt)

    content := &dapr.DataContent{Data: str}
    response, err := v1.Dapr.InvokeMethodWithContent(ctx, `faas-service`, service, `post`, content)
    if err != nil {
        logx.G(&ctx).Error(err, func() string {return service + `.common.faas.error`})
        return nil, err
    }
    _ = json.Unmarshal(response, &lx)

    if val, ok := lx[`data`].([]interface{}); ok {
        logx.G(&ctx).Debug(val, func() string {return service+`.common.service.result`})
        return val,nil
    }

    return reply, nil

}
