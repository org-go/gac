package ssoApi

import (
	"github.com/gin-gonic/gin"
	"github.com/go-playground/validator/v10"
	"payfun.gac.service/apps/errx"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/service/auths"
	"payfun.gac.service/apps/v1/service/subclass"
)

type SsoPermissionApi struct{}

// Create
// @Summary 添加权限
// @Description
// @Tags SSO/角色权限管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.AddSubclassPermissionReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /sso/permission/create [POST]
func (a *SsoPermissionApi) Create(c *gin.Context) {

	var opt req.AddSubclassPermissionReq
	defer logError(c)
	err, _ := c.ShouldBindJSON(&opt).(validator.ValidationErrors)
	if err != nil {
		panic(err)
	}
	opt.CreatedIp = c.ClientIP()
	opt.CreatedUser = auths.Authorized.AccountAdapter.Account
	e := subclass.Svc().BindSubclassPermission(c, opt)

	if e != nil {
		panic(errx.BindSubclass.CodeError())
	}

	success(c, "success")

}

// Query
// @Summary 查询权限
// @Description
// @Tags SSO/角色权限管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.QuerySubclassPermissionReq true "The object content"
// @Success 200 {object}   Response{data=resp.QueryPermissionResp}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /sso/permission/query [POST]
func (a *SsoPermissionApi) Query(c *gin.Context) {

	var opt req.QuerySubclassPermissionReq
	defer logError(c)
	err, _ := c.ShouldBindJSON(&opt).(validator.ValidationErrors)
	if err != nil {
		panic(err)
	}

	menus, e := subclass.Svc().QuerySubclassPermission(c, opt)

	if e != nil {
		panic(errx.QuerySubclass.CodeError())
	}

	success(c, menus)

}
