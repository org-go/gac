package resp

import "payfun.gac.service/apps/v1/entity/assembler"

type (
    //  AuthAdminMenuResps
    AuthAdminMenuResps []AuthAdminMenuResp
    //  AuthAdminMenuResp
    AuthAdminMenuResp struct {
        Pk         int32  `json:"pk"`
        ParentPk   int32  `json:"parent_pk"`
        ParentName string `json:"parent_name"` // 上级名称
        Icon       string `json:"icon"`        // icon
        Code       string `json:"code"`        // code
        Name       string `json:"name"`        // 名称
        Type       byte   `json:"type"`        // 类型： 1：菜单 3：按钮
        Show       byte   `json:"show"`        // 1:显示 2：隐藏
        Sort       int32  `json:"sort"`        // 排序
        Route      string `json:"route"`       // 前端路由
        Redirect   string `json:"redirect"`    // 前端路由重定向
        ApiRoute   string `json:"api_route"`   // 后端接口路由
        ViewPath   string `json:"view_path"`   // 前端文件路径
        Method     string `json:"method"`      // 请求方法:GET,POST,PUT,PATCH,DELETE
        I18nCode   string `json:"i18n_code"`   // 多语言code
        KeepAlive  byte   `json:"keep_alive"`  // 缓存 1:启用 2：禁用
    }
)

//
type (
    MultiMenuResp map[string]*assembler.MenuAssemblers

    SsoMenuResps map[string]SsoResp

    SsoResp struct {
        Name string `json:"name"`
        //Path string              `json:"path"`
        Menu *AuthAdminMenuResps `json:"menu"`
    }
)

/**
 * $(DTO)
 * @Description:
 * @receiver self
 * @param menus
 * @return menux
 */
func (self AuthAdminMenuResps) DTO(menux MultiMenuResp) (ssoMenu SsoMenuResps) {

    ssoMenu = make(map[string]SsoResp)
    for app, menus := range menux {
        var s SsoResp
        var tempMenu AuthAdminMenuResps
        for _, menu := range *menus {
            tempMenu = append(tempMenu, tempMenu.append(menu))
        }
        s.Menu = &tempMenu
        s.Name = app
        ssoMenu[app] = s
    }
    return ssoMenu
}

/**
 * $(append)
 * @Description:
 * @receiver self
 * @param menu
 * @return AuthAdminMenuResp
 */
func (self AuthAdminMenuResps) append(menu assembler.MenuAssembler) AuthAdminMenuResp {
    return AuthAdminMenuResp{
        Pk:         menu.Pk,
        ParentPk:   menu.ParentPk,
        ParentName: menu.ParentName,
        Icon:       menu.Icon,
        Code:       menu.Code,
        Name:       menu.Name,
        Type:       menu.Type,
        Show:       menu.Show,
        Sort:       menu.Sort,
        Route:      menu.Route,
        Redirect:   menu.Redirect,
        ApiRoute:   menu.ApiRoute,
        ViewPath:   menu.ViewPath,
        Method:     menu.Method,
        I18nCode:   menu.I18nCode,
        KeepAlive:  menu.KeepAlive,
    }
}
