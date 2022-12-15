package ssoApi

import (
	"github.com/gin-gonic/gin"
	"payfun.gac.service/apps/meta/contextx"
	"payfun.gac.service/apps/v1/service/accounts"
)

//
// @Summary 我的信息（服务商）
// @Description
// @Tags SSO/AUTH
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Success 200 {object}  Response{data=assembler.AccountProvider}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /sso/auth/provider/info [GET]
func (a *SsoAuthApi) Provider(c *gin.Context) {
	auth := contextx.FromAuthorized(c)
	if auth.AccountID == "" {
		failure(c, "not login")
		return
	}
	defer logError(c)

	item, err := accounts.ProvdSvc().Get(c, auth.AccountID)
	if err != nil {
		failure(c, "query error")
		return
	}
	item.AccountType = auth.AccountType

	success(c, item)
}
