package ssoApi

import (
	"github.com/gin-gonic/gin"
	"payfun.gac.service/apps/errx"
	"payfun.gac.service/apps/meta/contextx"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/service/accounts"
)

// Platform 平台
// @Summary 我的信息（平台）
// @Description
// @Tags SSO/AUTH
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Success 200 {object}  Response{data=assembler.AccountAdmin}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /sso/auth/platform/info [GET]
func (a *SsoAuthApi) Platform(c *gin.Context) {
	auth := contextx.FromAuthorized(c)
	accountID := auth.AccountID
	if accountID == "" {
		failure(c, "not login")
		return
	}
	defer logError(c)

	item, err := accounts.AdminSvc().Get(c, accountID)
	if err != nil {
		failure(c, "query error")
		return
	}
	item.AccountType = auth.AccountType

	success(c, item)
}

// Update 更新
// @Summary 更新
// @Description 更新
// @Tags SSO/AUTH
// @Produce  json
// @Param authorization header string false "Authorization"
// @Param body body req.UpdateAccountAdmin true "The object content"
// @Success 200 {object}  Response "data=OK"
// @Failure 400 {object}  Response
// @Router /sso/auth/platform/update [POST]
func (*SsoAuthApi) Update(c *gin.Context) {
	var accadmin req.UpdateAccountAdmin
	auth := contextx.FromAuthorized(c)
	accountID := auth.AccountID
	if accountID == "" {
		failure(c, "not login")
		return
	}

	err := c.ShouldBindJSON(&accadmin)
	if err != nil {
		failure(c, err.Error())
		return
	}

	err = accounts.AdminSvc().Update(c, accountID, accadmin)
	if err != nil {
		failure(c, "internal error")
		return
	}
	success(c, "OK")
}

// UpdatePassword 更新密码
// @Summary 更新密码
// @Description 更新密码
// @Tags SSO/AUTH
// @Produce  json
// @Param authorization header string false "Authorization"
// @Param body body req.AcctChangePasswd true "The object content"
// @Success 200 {object}  Response "data=OK"
// @Failure 400 {object}  Response
// @Router /sso/auth/platform/update_password [POST]
func (*SsoAuthApi) UpdatePassword(c *gin.Context) {
	auth := contextx.FromAuthorized(c)
	accountID := auth.AccountID
	if accountID == "" {
		panic(errx.AccountNoExisted)
	}

	var acctpasswd req.AcctChangePasswd
	err := c.ShouldBindJSON(&acctpasswd)
	if err != nil {
		failure(c, err.Error())
		return
	}

	err = accounts.AdminSvc().UpdatePassword(c, accountID, acctpasswd)
	if err != nil {
		failure(c, errx.AcctChangePasswd.CodeField)
		return
	}
	success(c, "OK")
}
