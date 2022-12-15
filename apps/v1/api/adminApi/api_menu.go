package adminApi

import (
	"github.com/gin-gonic/gin"
	"github.com/go-playground/validator/v10"
	"payfun.gac.service/apps/errx"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/service/admins"
	"payfun.gac.service/apps/v1/service/auths"
)

type MenuApi struct{}

// Page
// @Summary 菜单列表
// @Description
// @Tags GAC/菜单管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.MenuReq true "The object content"
// @Success 200 {object}  Response{data=assembler.MenuAssemblers}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/menu/page [POST]
func (a *MenuApi) Page(c *gin.Context) {

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

// Tree
// @Summary 菜单树形结构
// @Description
// @Tags GAC/菜单管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Success 200 {object}  Response{data=assembler.MenuTree}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/menu/tree [POST]
func (a *MenuApi) Tree(c *gin.Context) {

	var opt req.MenuReq
	defer logError(c)
	err := c.ShouldBindJSON(&opt)
	if err != nil {
		panic(err)
	}

	menuTree, e := admins.Svc().GetMenuTree(c, opt)
	if e != nil {
		panic(errx.Menus.CodeError())
	}
	success(c, menuTree)

}

// Create
// @Summary 增加菜单
// @Description
// @Tags GAC/菜单管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.AddMenuReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/menu/create [POST]
func (a *MenuApi) Create(c *gin.Context) {

	var opt req.AddMenuReq
	defer logError(c)
	err, _ := c.ShouldBindJSON(&opt).(validator.ValidationErrors)
	if err != nil {
		panic(err)
	}
	opt.CreatedIp = c.ClientIP()
	opt.CreatedUser = auths.Authorized.AccountAdapter.Account
	data, e := admins.Svc().AddMenu(c, opt)

	if e != nil {
		panic(errx.AddMenu.CodeError())
	}

	success(c, data)

}

// Update
// @Summary 更新菜单
// @Description
// @Tags GAC/菜单管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.UpdateMenuReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/menu/update [POST]
func (a *MenuApi) Update(c *gin.Context) {

	var opt req.UpdateMenuReq
	defer logError(c)
	err, _ := c.ShouldBindJSON(&opt).(validator.ValidationErrors)
	if err != nil {
		panic(err)
	}
	opt.CreatedIp = c.ClientIP()
	opt.CreatedUser = auths.Authorized.AccountAdapter.Account
	_, e := admins.Svc().UpdateMenu(c, opt)

	if e != nil {
		panic(errx.UpdateMenu.CodeError())
	}

	success(c, "success")

}

// Disable
// @Summary 菜单禁用/启用
// @Description
// @Tags GAC/菜单管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.UpdateMenuStatusReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/menu/disable [POST]
func (a *MenuApi) Disable(c *gin.Context) {

	var opt req.UpdateMenuStatusReq
	defer logError(c)
	err, _ := c.ShouldBindJSON(&opt).(validator.ValidationErrors)
	if err != nil {
		panic(err)
	}
	opt.CreatedIp = c.ClientIP()
	opt.CreatedUser = auths.Authorized.AccountAdapter.Account
	e := admins.Svc().DisableMenu(c, opt)

	if e != nil {
		if e.Error() == "menu has role" {
			panic(errx.MenuHasRole.CodeError())
		} else {
			panic(errx.DisableMenu.CodeError())
		}

	}

	success(c, "success")

}

// Delete
// @Summary 菜单删除
// @Description
// @Tags GAC/菜单管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.UpdateMenuStatusReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/menu/delete [POST]
func (a *MenuApi) Delete(c *gin.Context) {

	var opt req.UpdateMenuStatusReq
	defer logError(c)
	err, _ := c.ShouldBindJSON(&opt).(validator.ValidationErrors)
	if err != nil {
		panic(err)
	}
	opt.CreatedIp = c.ClientIP()
	opt.CreatedUser = auths.Authorized.AccountAdapter.Account
	e := admins.Svc().DelMenu(c, opt)

	if e != nil {
		if e.Error() == "menu has role" {
			panic(errx.MenuHasRole.CodeError())
		} else {
			panic(errx.DelMenu.CodeError())
		}

	}

	success(c, "success")

}
