package adminApi

import (
	"github.com/gin-gonic/gin"
	"payfun.gac.service/apps/errx"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/service/admins"
	"payfun.gac.service/apps/v1/service/auths"
)

type StaffRoleApi struct{}

// Page
// @Summary 角色列表
// @Description
// @Tags GAC/员工角色管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.RolePageReq true "The object content"
// @Success 200 {object}  Response{data=assembler.RoleAssemblers}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/staff_role/page [POST]
func (a *StaffRoleApi) Page(c *gin.Context) {

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
// @Tags GAC/员工角色管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.AddRoleReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/staff_role/create [POST]
func (a *StaffRoleApi) Create(c *gin.Context) {

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
// @Tags GAC/员工角色管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.UpdateRoleReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/staff_role/update [POST]
func (a *StaffRoleApi) Update(c *gin.Context) {

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
		panic(errx.AddMenu.CodeError())
	}

	success(c, data)

}

// Disable
// @Summary 角色禁用/启用
// @Description
// @Tags GAC/员工角色管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.UpdateRoleStatusReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/staff_role/disable [POST]
func (a *StaffRoleApi) Disable(c *gin.Context) {

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
		panic(errx.AddMenu.CodeError())
	}

	success(c, "success")

}

// Delete
// @Summary 角色删除
// @Description
// @Tags GAC/员工角色管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.UpdateRoleStatusReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/staff_role/delete [POST]
func (a *StaffRoleApi) Delete(c *gin.Context) {

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
		panic(errx.AddMenu.CodeError())
	}

	success(c, "success")

}
