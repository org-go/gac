package ssoApi

import (
	"github.com/gin-gonic/gin"
	"payfun.gac.service/apps/errx"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/entity/adapter"
	"payfun.gac.service/apps/v1/service/auths"
	"payfun.gac.service/apps/v1/service/subclass"
)

type SsoMenuApi struct{}

// Page
// @Summary 菜单列表
// @Description
// @Tags SSO/菜单管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body  req.SubclassMenuReq true "The object content"
// @Success 200 {object}  Response{data=assembler.MenuAssemblers}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /sso/menu/page [POST]
func (a *SsoMenuApi) Page(c *gin.Context) {

	var opt req.SubclassMenuReq
	defer logError(c)
	err := c.ShouldBindJSON(&opt)
	if err != nil {
		panic(err)
	}
	switch auths.Authorized.AccountAdapter.Type {
	// admin // staff // org   内部
	case adapter.Org:
		opt.Type = 1
	// sub 外部
	case adapter.Subclass:
		opt.Type = 2

	}
	opt.RolePk = int(auths.Authorized.AccountAdapter.RoleId)
	data, page, e := subclass.Svc().GetMenuPage(c, opt)

	if e != nil {
		panic(errx.MenusSubclass.CodeError())
	}

	success(c, PageData{List: data, Pagination: page})

}
