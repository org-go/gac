package adminApi

import (
	"github.com/gin-gonic/gin"
	"github.com/go-playground/validator/v10"
	"payfun.gac.service/apps/errx"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/service/admins"
	"payfun.gac.service/apps/v1/service/auths"
)

type PermissionApi struct{}

// Create
// @Summary 添加权限
// @Description
// @Tags GAC/管理员角色权限管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.AddPermissionReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/permission/create [POST]
func (a *PermissionApi) Create(c *gin.Context) {

	var opt req.AddPermissionReq
	defer logError(c)
	err, _ := c.ShouldBindJSON(&opt).(validator.ValidationErrors)
	if err != nil {
		panic(err)
	}
	opt.CreatedIp = c.ClientIP()
	opt.CreatedUser = auths.Authorized.AccountAdapter.Account
	e := admins.Svc().BindPermission(c, opt)

	if e != nil {
		panic(errx.Bind.CodeError())
	}

	success(c, "success")

}

// Query
// @Summary 查询权限
// @Description
// @Tags GAC/管理员角色权限管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.QueryPermissionReq true "The object content"
// @Success 200 {object}   Response{data=resp.QueryPermissionResp}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/permission/query [POST]
func (a *PermissionApi) Query(c *gin.Context) {

	var opt req.QueryPermissionReq
	defer logError(c)
	err, _ := c.ShouldBindJSON(&opt).(validator.ValidationErrors)
	if err != nil {
		panic(err)
	}

	menus, e := admins.Svc().QueryPermission(c, opt)

	if e != nil {
		panic(errx.Query.CodeError())
	}

	success(c, menus)

}

// Menus
// @Summary 菜单列表
// @Description
// @Tags GAC/管理员角色查询菜单列表
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.MenuReq true "The object content"
// @Success 200 {object}  Response{data=assembler.MenuAssemblers}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/permission/menus [POST]
func (a *PermissionApi) Menus(c *gin.Context) {

	var opt req.MenuReq
	defer logError(c)
	err := c.ShouldBindJSON(&opt)
	if err != nil {
		panic(err)
	}

	data, page, e := admins.Svc().GetMenuPage(c, opt)

	if e != nil {
		panic(errx.Menus.CodeError())
	}

	success(c, PageData{List: data, Pagination: page})

}
