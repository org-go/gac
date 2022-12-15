package ssoApi

import (
	"github.com/gin-gonic/gin"
	"payfun.gac.service/apps/errx"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/service/auths"
	"payfun.gac.service/apps/v1/service/subclass"
)

type SsoRoleApi struct{}

// Page
// @Summary 角色列表
// @Description
// @Tags SSO/角色管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.SubclassRolePageReq true "The object content"
// @Success 200 {object}  Response{data=assembler.RoleSubclassAssemblers}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /sso/role/page [POST]
func (a *SsoRoleApi) Page(c *gin.Context) {

	var opt req.SubclassRolePageReq
	defer logError(c)
	err := c.ShouldBindJSON(&opt)
	if err != nil {
		panic(err)
	}
	opt.AccountId = auths.Authorized.AccountAdapter.AccountID
	data, page, e := subclass.Svc().GetSubclassRolePage(c, opt)

	if e != nil {
		panic(errx.SubclassRoles.CodeError())
	}

	success(c, PageData{List: data, Pagination: page})

}

// Create
// @Summary 添加角色
// @Description
// @Tags SSO/角色管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.AddSubclassRoleReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /sso/role/create [POST]
func (a *SsoRoleApi) Create(c *gin.Context) {

	var opt req.AddSubclassRoleReq
	defer logError(c)
	err := c.ShouldBindJSON(&opt)
	if err != nil {
		panic(err)
	}
	opt.CreatedIp = c.ClientIP()
	opt.CreatedUser = auths.Authorized.AccountAdapter.Account
	opt.AccountId = auths.Authorized.AccountAdapter.AccountID
	role, e := subclass.Svc().AddSubclassRole(c, opt)

	if e != nil {
		panic(errx.AddSubclassRole.CodeError())
	}

	success(c, role)

}

// Update
// @Summary 更新角色
// @Description
// @Tags SSO/角色管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.UpdateSubclassRoleReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /sso/role/update [POST]
func (a *SsoRoleApi) Update(c *gin.Context) {

	var opt req.UpdateSubclassRoleReq
	defer logError(c)
	err := c.ShouldBindJSON(&opt)
	if err != nil {
		panic(err)
	}
	opt.CreatedIp = c.ClientIP()
	opt.CreatedUser = auths.Authorized.AccountAdapter.Account
	opt.AccountId = auths.Authorized.AccountAdapter.AccountID
	data, e := subclass.Svc().UpdateSubclassRole(c, opt)

	if e != nil {
		if e.Error() == "role has account" {
			panic(errx.RoleHasAccount.CodeError())
		} else {
			panic(errx.UpdateSubclassRole.CodeError())
		}

	}

	success(c, data)

}

// Disable
// @Summary 角色禁用/启用
// @Description
// @Tags SSO/角色管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.UpdateRoleStatusReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /sso/role/disable [POST]
func (a *SsoRoleApi) Disable(c *gin.Context) {

	var opt req.UpdateRoleStatusReq
	defer logError(c)
	err := c.ShouldBindJSON(&opt)
	if err != nil {
		panic(err)
	}
	opt.CreatedIp = c.ClientIP()
	opt.CreatedUser = auths.Authorized.AccountAdapter.Account
	e := subclass.Svc().DisableSubclassRole(c, opt)

	if e != nil {
		if e.Error() == "role has account" {
			panic(errx.RoleHasAccount.CodeError())
		} else {
			panic(errx.DisableSubclassRole.CodeError())
		}

	}

	success(c, "success")

}

// Delete
// @Summary 角色删除
// @Description
// @Tags SSO/角色管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.UpdateRoleStatusReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /sso/role/delete [POST]
func (a *SsoRoleApi) Delete(c *gin.Context) {

	var opt req.UpdateRoleStatusReq
	defer logError(c)
	err := c.ShouldBindJSON(&opt)
	if err != nil {
		panic(err)
	}
	opt.CreatedIp = c.ClientIP()
	opt.CreatedUser = auths.Authorized.AccountAdapter.Account
	e := subclass.Svc().DelSubclassRole(c, opt)

	if e != nil {
		if e.Error() == "role has account" {
			panic(errx.RoleHasAccount.CodeError())
		} else {
			panic(errx.DelSubclassRole.CodeError())
		}

	}

	success(c, "success")

}

// Option
// @Summary 角色列表下拉
// @Description
// @Tags SSO/角色管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.SubclassRoleReq true "The object content"
// @Success 200 {object}  Response{data=assembler.RoleSubclassAssemblers}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /sso/role/option [POST]
func (a *SsoRoleApi) Option(c *gin.Context) {

	var opt req.SubclassRoleReq
	defer logError(c)
	err := c.ShouldBindJSON(&opt)
	if err != nil {
		panic(err)
	}
	opt.AccountId = auths.Authorized.AccountAdapter.AccountID

	data, _, e := subclass.Svc().GetSubclassRoles(c, opt)

	if e != nil {
		if e.Error() == "role has account" {
			panic(errx.RoleHasAccount.CodeError())
		} else {
			panic(errx.RoleHasSubclassAccount.CodeError())
		}

	}

	success(c, data)

}
