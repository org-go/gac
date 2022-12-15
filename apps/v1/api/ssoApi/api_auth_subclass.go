package ssoApi

import (
    "github.com/gin-gonic/gin"
    "github.com/go-playground/validator/v10"
    "payfun.gac.service/apps/errx"
    "payfun.gac.service/apps/v1/dto/req"
    "payfun.gac.service/apps/v1/service/auths"
    "payfun.gac.service/apps/v1/service/subclass"
)


//
// @Summary 编辑我的子账户
// @Description
// @Tags SSO/AUTH
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body req.AuthSubclassUpdateReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /sso/auth/subclass/update [POST]
func (a *SsoAccountSubclassApi) Update(c *gin.Context) {

    var opt req.AuthSubclassUpdateReq
    defer logError(c)
    err, _ := c.ShouldBindJSON(&opt).(validator.ValidationErrors)
    if err != nil {
        panic(err)
    }
    er := subclass.Svc().SelfUpdateSubclassAccount(c, opt)
    if er != nil {
        panic(errx.EditSubclass)
    }
    success(c, `ok`)

}



//
// @Summary 我的信息（子账户）
// @Description
// @Tags SSO/AUTH
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /sso/auth/subclass/info [GET]
func (a *SsoAuthApi) Info(c *gin.Context) {

    defer logError(c)

    if auths.Authorized.SubAccount == `` {
        panic(errx.Subclass.CodeError())
    }
    info := subclass.Svc().SelfGetSubclassAccountInfo(c)

    success(c, info)

}


//
// @Summary 子账户重置密码
// @Description
// @Tags SSO/AUTH
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body req.AuthSubclassResetPasswordReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /sso/auth/subclass/rest_password [POST]
func (a *SsoAuthApi) Password(c *gin.Context) {

    var opt req.AuthSubclassResetPasswordReq
    defer logError(c)
    err, _ := c.ShouldBindJSON(&opt).(validator.ValidationErrors)
    if err != nil {
        panic(err)
    }
    er := subclass.Svc().SelfRestSubclassAccountPassword(c, opt)
    if er != nil {
        panic(errx.EditSubclass)
    }

    success(c, `ok`)

}
