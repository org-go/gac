package adminApi

import (
	"github.com/gin-gonic/gin"
	"payfun.gac.service/apps/errx"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/service/admins"
	"payfun.gac.service/apps/v1/service/auths"
)

type RoleApi struct{}

// Page
// @Summary 角色列表
// @Description
// @Tags GAC/管理员角色管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.RolePageReq true "The object content"
// @Success 200 {object}  Response{data=assembler.RoleAssemblers}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/role/page [POST]
func (a *RoleApi) Page(c *gin.Context) {

	var opt req.RolePageReq
	defer logError(c)
	err := c.ShouldBindJSON(&opt)
	if err != nil {
		panic(err)
	}

	data, page, e := admins.Svc().GetRolePage(c, opt)

	if e != nil {
		panic(errx.Roles.CodeError())
	}

	success(c, PageData{List: data, Pagination: page})

}

// Create
// @Summary 添加角色
// @Description
// @Tags GAC/管理员角色管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.AddRoleReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/role/create [POST]
func (a *RoleApi) Create(c *gin.Context) {

	var opt req.AddRoleReq
	defer logError(c)
	err := c.ShouldBindJSON(&opt)
	if err != nil {
		panic(err)
	}
	opt.CreatedIp = c.ClientIP()
	opt.CreatedUser = auths.Authorized.AccountAdapter.Account
	role, e := admins.Svc().AddRole(c, opt)

	if e != nil {
		panic(errx.AddRole.CodeError())
	}

	success(c, role)

}

// Update
// @Summary 更新角色
// @Description
// @Tags GAC/管理员角色管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.UpdateRoleReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/role/update [POST]
func (a *RoleApi) Update(c *gin.Context) {

	var opt req.UpdateRoleReq
	defer logError(c)
	err := c.ShouldBindJSON(&opt)
	if err != nil {
		panic(err)
	}
	opt.CreatedIp = c.ClientIP()
	opt.CreatedUser = auths.Authorized.AccountAdapter.Account
	data, e := admins.Svc().UpdateRole(c, opt)

	if e != nil {
		if e.Error() == "role has account" {
			panic(errx.RoleHasAccount.CodeError())
		}
		panic(errx.UpdateRole.CodeError())
	}

	success(c, data)

}

// Disable
// @Summary 角色禁用/启用
// @Description
// @Tags GAC/管理员角色管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.UpdateRoleStatusReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/role/disable [POST]
func (a *RoleApi) Disable(c *gin.Context) {

	var opt req.UpdateRoleStatusReq
	defer logError(c)
	err := c.ShouldBindJSON(&opt)
	if err != nil {
		panic(err)
	}
	opt.CreatedIp = c.ClientIP()
	opt.CreatedUser = auths.Authorized.AccountAdapter.Account
	e := admins.Svc().DisableRole(c, opt)

	if e != nil {
		if e.Error() == "role has account" {
			panic(errx.RoleHasAccount.CodeError())
		}
		panic(errx.DisableRole.CodeError())
	}

	success(c, "success")

}

// Delete
// @Summary 角色删除
// @Description
// @Tags GAC/管理员角色管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.UpdateRoleStatusReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/role/delete [POST]
func (a *RoleApi) Delete(c *gin.Context) {

	var opt req.UpdateRoleStatusReq
	defer logError(c)
	err := c.ShouldBindJSON(&opt)
	if err != nil {
		panic(err)
	}
	opt.CreatedIp = c.ClientIP()
	opt.CreatedUser = auths.Authorized.AccountAdapter.Account
	e := admins.Svc().DelRole(c, opt)

	if e != nil {
		if e.Error() == "role has account" {
			panic(errx.RoleHasAccount.CodeError())
		}
		panic(errx.DelRole.CodeError())
	}

	success(c, "success")

}

// Option
// @Summary 角色列表下拉
// @Description
// @Tags GAC/管理员角色管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.RoleReq true "The object content"
// @Success 200 {object}  Response{data=assembler.RoleAssemblers}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/role/option [POST]
func (a *RoleApi) Option(c *gin.Context) {

	var opt req.RoleReq
	defer logError(c)
	err := c.ShouldBindJSON(&opt)
	if err != nil {
		panic(err)
	}
	data, _, e := admins.Svc().GetRoles(c, opt)

	if e != nil {
		panic(errx.Roles.CodeError())
	}

	success(c, data)

}
