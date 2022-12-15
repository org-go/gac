package adminApi

import (
    "github.com/gin-gonic/gin"
    "payfun.gac.service/apps/v1/dto/req"
    "payfun.gac.service/apps/v1/dto/resp"
    "payfun.gac.service/apps/v1/entity/adapter"
    "payfun.gac.service/apps/v1/service/auths"
)

type AuthApi struct {}


//
// @Summary 我的权限（菜单+按钮）
// @Description
// @Tags GAC/AUTH
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body req.PermissionAuthReq true "The object content"
// @Success 200 {object}  Response{data=resp.SsoMenuResps}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/auth/my_permission [POST]
func (a *AuthApi) Me(c *gin.Context) {

    var opt req.PermissionAuthReq
    defer logError(c)
     _ = c.ShouldBindJSON(&opt)

    menus := auths.Svc().Permission(c, adapter.AuthAdapter{
        Orgs:          opt.Orgs,
        Apps:          []string{`gac`},
        AccountAdapter: auths.Authorized.AccountAdapter,
    })
    menux := resp.AuthAdminMenuResps{}
    dto := menux.DTO(menus)

    success(c, dto)

}
