package ssoApi

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/go-playground/validator/v10"
	"payfun.gac.service/apps/call/acs"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/dto/resp"
	"payfun.gac.service/apps/v1/entity/adapter"
	"payfun.gac.service/apps/v1/service/auths"
	"strings"
)

type SsoAuthApi struct{}

//
// @Summary 我的权限（菜单+按钮）
// @Description
// @Tags SSO/AUTH
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body req.PermissionAuthReq true "The object content"
// @Success 200 {object}  Response{data=resp.SsoMenuResps}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /sso/auth/my_permission [POST]
func (a *SsoAuthApi) Me(c *gin.Context) {

	var opt req.PermissionAuthReq
	defer logError(c)
	_ = c.ShouldBindJSON(&opt)

	menus := auths.Svc().Permission(c, adapter.AuthAdapter{
		Orgs:           opt.Orgs,
		Apps:           opt.Apps,
		AccountAdapter: auths.Authorized.AccountAdapter,
	})
	menux := resp.AuthAdminMenuResps{}
	dto := menux.DTO(menus)

	success(c, dto)

}

//
// @Summary Passport认证（后端服务之间调用）
// @Description
// @Tags SSO/AUTH
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body req.SsoPassportAuthReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /sso/auth/passport [POST]
func (a *SsoAuthApi) Sso(c *gin.Context) {

	var opt req.SsoPassportAuthReq
	defer logError(c)
	err := c.ShouldBindJSON(&opt).(validator.ValidationErrors)
	if err != nil {
		panic(err)
	}
	obj := strings.TrimLeft(opt.Uri, `/`)
	act := strings.ToUpper(opt.Method)
	sub := fmt.Sprintf(`%s%d`, auths.Authorized.Type, auths.Authorized.RoleId)
	policy := acs.Enforcer.HasPolicy(sub, obj, act)

	success(c, policy)

}
