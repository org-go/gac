package ssoApi

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/wangcheng0509/gpkg/app"
	"github.com/wangcheng0509/gpkg/e"
	"payfun.gac.service/apps/errx"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/service/accounts"
	"payfun.gac.service/apps/v1/service/ssos"
)

type SsoAccountApi struct{}

type token struct{}

// Login 登录
// @Description 登录
// @Tags SSO/账户管理
// @Accept  json
// @Produce  json
// @Security x-token
// @Param body body req.AccountLogin true "The object content"
// @Success 200 {object}  Response{data=resp.LoginResp{token=token{access_token=string,expiry=string}}} "expiry:时间"
// @Failure 400 {object}  Response
// @Router /sso/account/login [POST]
func (s *SsoAccountApi) Login(c *gin.Context) {
	var accountLogin req.AccountLogin
	err := c.ShouldBindJSON(&accountLogin)
	if err != nil {
		failure(c, err.Error())
		return
	}

	res, _, _ := accounts.AdminSvc().Query(c, req.QueryAccountParams{
		Account: accountLogin.Account,
	})
	if len(res) >= 1 && (res[0].RoleType == "A" || res[0].RoleType == "B" || res[0].RoleType == "") {
		failure(c, errx.AccountNoExisted.CodeField)
		return
	}

	rsp, err := ssos.SsoAcctSvc().Login(c, accountLogin)
	if err != nil {
		failure(c, err.Error())
		return
	}

	c.JSON(http.StatusOK, app.Response{
		Code:    e.SUCCESS,
		Message: "ok",
		Data:    rsp,
	})
}

// ProvdLogin 服务商登录
// @Description 服务商登录
// @Tags SSO/账户管理
// @Accept  json
// @Produce  json
// @Security x-token
// @Param body body req.AccountLogin true "The object content"
// @Success 200 {object}  Response{data=resp.LoginResp{token=token{access_token=string,expiry=string}}} "expiry:时间"
// @Failure 400 {object}  Response
// @Router /sso/account/provd_login [POST]
func (s *SsoAccountApi) ProvdLogin(c *gin.Context) {
	var accountLogin req.AccountLogin
	err := c.ShouldBindJSON(&accountLogin)
	if err != nil {
		failure(c, err.Error())
		return
	}

	accountLogin.AccountType = 2
	rsp, err := ssos.SsoAcctSvc().Login(c, accountLogin)
	if err != nil {
		failure(c, err.Error())
		return
	}

	c.JSON(http.StatusOK, app.Response{
		Code:    e.SUCCESS,
		Message: "ok",
		Data:    rsp,
	})
}
