package auths

import (
	"context"
	"encoding/json"
	"fmt"
	"github.com/gin-gonic/gin"
	"payfun.gac.service/apps/call/acs"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/dto/resp"
	"payfun.gac.service/apps/v1/entity/adapter"
	"payfun.gac.service/apps/v1/entity/assembler"
	"payfun.gac.service/apps/v1/service/admins"
	"payfun.gac.service/apps/v1/service/subclass"
	"payfun.gac.service/pkg/org.pm.sdk/logx"
	"strings"
)






/**
 * $(Permission)
 * @Description:
 * @receiver this
 * @param ctx
 * @param auth
 * @return menux
 */
func (this authService) Permission(ctx *gin.Context, auth adapter.AuthAdapter) (menux resp.MultiMenuResp) {

	menux = make(map[string]*assembler.MenuAssemblers)
	var err error

	switch auth.Type {
	// sub 外部
	case adapter.Subclass:
		menux, err = this.permissionRoleSubclass(ctx, auth.AccountAdapter, auth.Apps...)
	// admin // staff // org   内部
	case adapter.Admin, adapter.Staff,  adapter.Org:
		menux, err = this.permissionRole(ctx, auth.AccountAdapter, auth.Apps...)
	// super
	case adapter.Super:
		opt := req.MenuReq{Types: []int{1, 3}, Status: 1, AppPk: 1}
		temp, _, _ := admins.Svc().GetMenuPage(ctx, opt)
		menux[`gac`] = &temp
		return menux
	default:
		return menux
	}
	if err != nil {
		logx.C(ctx).Error(err, func() string { return `gac.auth.permission.error` })
	}
	// save
	acs.Enforcer.EnableAutoSave(false)
	for _, menus := range menux {
		for _, menu := range *menus {
		/*	menu.ApiRoute = `gac/v1/admin/org/page`
			menu.Method = `POST`*/
			if menu.ApiRoute != `` {
				// fixme eros : "act" filter format: menu.AppPk+menu.ApiRoute
				_, _ = acs.Enforcer.AddPolicy(fmt.Sprintf(`%s%d`,auth.Type, auth.RoleId), strings.TrimLeft(menu.ApiRoute, `/`), menu.Method)
			}
		}
	}
	_ = acs.Enforcer.BuildRoleLinks()
	return menux

}

/**
 * $(permissionRole)
 * @Description:
 * @receiver this
 * @param ctx
 * @param account
 * @return menus
 */
func (this authService) permissionRole(ctx context.Context, account adapter.AccountAdapter, apps ...string) (menux resp.MultiMenuResp, err error) {

	data := this.edge.Redis.HMGet(ctx, fmt.Sprintf(admins.RolePermissionRedis, account.RoleId), apps...).Val()
	if len(data) == 0 {
		return menux, nil
	}
	menux = _role(data, apps...)
	return menux, err

}

/**
 * $(permissionRoleSubclass)
 * @Description:
 * @receiver this
 * @param ctx
 * @param account
 * @param apps
 * @return menux
 * @return err
 */
func (this authService) permissionRoleSubclass(ctx context.Context, account adapter.AccountAdapter, apps ...string) (menux resp.MultiMenuResp, err error) {

	data := this.edge.Redis.HMGet(ctx, fmt.Sprintf(subclass.RolePermissionSubclassRedis, account.RoleId), apps...).Val()
	if len(data) == 0 {
		return menux, nil
	}
	menux = _role(data, apps...)
	return menux, err

}

/**
 * $(_role)
 * @Description:
 * @param data
 * @param apps
 * @return menux
 */
func _role(data []interface{}, apps ...string) (menux resp.MultiMenuResp) {
	menux = make(map[string]*assembler.MenuAssemblers)
	for i, val := range data {
		var menu assembler.MenuAssemblers
		switch val.(type) {
		case string:
			_ = json.Unmarshal([]byte(val.(string)), &menu)
		}
		if app := apps[i]; app != `` {
			if _, ok := menux[app]; !ok {
				menux[app] = &menu
			}
		}
	}
	return menux
}
