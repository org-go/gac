package faas

import (
    "context"
)

type faasService struct {

}



/**
 * $(Locale)
 * @Description: 获取译文 locale := faas.Svc().Locale(ctx, `ja`, `COMMON_MSG_00001`, `COMMON_MSG_00002`)
 * @receiver this
 * @param ctx
 * @param lang
 * @param codes
 * @return []interface{}
 */
func (this faasService) Locale(ctx context.Context, lang string, codes ...string) []interface{} {

    locales := struct {
        Locale string `json:"locale"`
        Code []string `json:"code"`
    }{
        Locale: lang,
        Code: codes,
    }
    //locales := `{"code":["COMMON_MSG_00001","COMMON_MSG_00002"],"locale":"ja"}`
    title, _ := this.dial(ctx, locales, `faas/v1/globe/i18n/get_codes`)

    return title

}





