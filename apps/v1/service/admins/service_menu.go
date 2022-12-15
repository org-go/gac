package admins

import (
	"context"
	"encoding/json"
	"fmt"
	"payfun.gac.service/apps/errx"
	"payfun.gac.service/apps/v1/dto/common"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/entity/assembler"
	"payfun.gac.service/apps/v1/entity/model"
	"payfun.gac.service/apps/v1/repository/app"
	"payfun.gac.service/apps/v1/repository/menu"
	"payfun.gac.service/apps/v1/repository/org"
	"payfun.gac.service/apps/v1/repository/permission"
	"payfun.gac.service/apps/v1/service/subclass"
	"payfun.gac.service/pkg/org.pm.sdk/lib"
	"sort"
	"strings"
	"time"
)

func (m *adminService) GetMenuPage(ctx context.Context, opt req.MenuReq) (assembler.MenuAssemblers, *common.PaginationResult, error) {
	repoMenu := menu.RepoMenu
	return repoMenu.Menus(ctx, opt)
}

func (m adminService) AddMenu(ctx context.Context, opt req.AddMenuReq) (*model.AuthMenu, error) {
	m.edge.WithLog(ctx, errx.AddMenu, opt)
	repoMenu := menu.RepoMenu
	var parentName, joins string
	if opt.ParentPk > 0 {
		menuData, err := repoMenu.Menu(ctx, req.MenuReq{
			Pk:     int(opt.ParentPk),
			Status: 1,
		})
		if err != nil || menuData.Pk == 0 {
			return &model.AuthMenu{}, fmt.Errorf("parent menu not find")
		}
		parentName = menuData.Name
		joins = strings.TrimLeft(fmt.Sprintf("%s,%d", menuData.Joins, menuData.Pk), ",")
	}
	var method string
	if len(opt.Method) > 0 {
		method = opt.Method
	} else {
		method = "GET"
	}
	return repoMenu.AddMenu(ctx, &model.AuthMenu{
		OrgPk:       opt.OrgPk,
		AppPk:       opt.AppPk,
		ParentPk:    opt.ParentPk,
		ParentName:  parentName,
		Joins:       joins,
		Name:        opt.Name,
		Code:        opt.Code,
		ApiRoute:    strings.Trim(opt.ApiRoute, " "),
		Route:       opt.Route,
		ViewPath:    opt.ViewPath,
		Method:      method,
		Redirect:    opt.Redirect,
		Sort:        opt.Sort,
		Type:        opt.Type,
		Show:        opt.Show,
		Status:      opt.Status,
		Icon:        opt.Icon,
		KeepAlive:   opt.KeepAlive,
		CreatedUser: opt.CreatedUser,
		CreatedTime: time.Now(),
		CreatedIp:   opt.CreatedIp,
		I18nCode:    opt.I18nCode,
	})
}

func (m adminService) UpdateMenu(ctx context.Context, opt req.UpdateMenuReq) (*model.AuthMenu, error) {
	m.edge.WithLog(ctx, errx.UpdateMenu, opt)
	repoMenu := menu.RepoMenu
	var parentName, joins string
	if opt.ParentPk > 0 {
		menuData, err := repoMenu.Menu(ctx, req.MenuReq{
			Pk:     int(opt.ParentPk),
			Status: 1,
		})
		if err != nil || menuData.Pk == 0 {
			return &model.AuthMenu{}, fmt.Errorf("parent menu not find")
		}
		parentName = menuData.Name
		joins = strings.TrimLeft(fmt.Sprintf("%s,%d", menuData.Joins, menuData.Pk), ",")
	}
	var method string
	if len(opt.Method) > 0 {
		method = opt.Method
	} else {
		method = "GET"
	}
	updateMenu := &model.AuthMenu{
		Pk:          opt.Pk,
		OrgPk:       opt.OrgPk,
		AppPk:       opt.AppPk,
		ApiRoute:    opt.ApiRoute,
		ParentPk:    opt.ParentPk,
		ParentName:  parentName,
		Joins:       joins,
		Name:        opt.Name,
		Code:        opt.Code,
		Route:       opt.Route,
		ViewPath:    opt.ViewPath,
		Method:      method,
		Redirect:    opt.Redirect,
		Sort:        opt.Sort,
		Type:        opt.Type,
		Show:        opt.Show,
		Status:      opt.Status,
		Icon:        opt.Icon,
		KeepAlive:   opt.KeepAlive,
		I18nCode:    opt.I18nCode,
		CreatedIp:   opt.CreatedIp,
		CreatedUser: opt.CreatedUser,
	}
	updateMenuData, err := repoMenu.UpdateMenu(ctx, updateMenu)
	_ = repoMenu.UpdateParentMenuInfo(ctx, updateMenu)

	if err == nil {
		// 获取APP
		appx, _ := app.RepoApp.App(ctx, assembler.AdminAppAssembler{Pk: opt.AppPk})

		// 获取Org
		orgs, _, _ := org.RepoOrg.Orgs(ctx, assembler.AdminOrgAssembler{Pk: opt.OrgPk}, common.PaginationParam{})

		// 处理Redis缓存得菜单信息
		repoPermission := permission.RepoPermission

		permissionsByMenuId, _ := repoPermission.PermissionsByMenuId(ctx, req.PermissionsByMenuIdReq{
			MenuPk: int(opt.Pk),
		})

		for _, item := range permissionsByMenuId {
			rolePermissionRedisKey := fmt.Sprintf(RolePermissionRedis, item.RolePk)
			data := m.edge.Redis.HGet(ctx, rolePermissionRedisKey, appx.Code).Val()
			if len(data) > 0 {
				var redisMenu assembler.MenuAssemblers
				err = json.Unmarshal([]byte(data), &redisMenu)
				for index, menuAssembler := range redisMenu {
					if opt.Pk == menuAssembler.Pk {
						redisMenu[index] = assembler.MenuAssembler{
							AuthMenu: *updateMenu,
							AppCode:  appx.Code,
							AppName:  appx.Name,
							OrgName:  orgs[0].Name,
						}
						sort.Sort(
							assembler.MenuAssemblersWrapper{
								Menus: redisMenu,
								SortBy: func(p, q *assembler.MenuAssembler) bool {
									if p.ParentPk != q.ParentPk {
										return p.ParentPk < q.ParentPk // ParentPk 递增排序
									}
									if p.Type != q.Type {
										return p.Type < q.Type // Type 递增排序
									}
									return p.Sort < q.Sort // Sort 递增排序
								},
							},
						)
						menusBytes, _ := json.Marshal(redisMenu)
						_ = m.edge.Redis.HSet(ctx, rolePermissionRedisKey, appx.Code, string(menusBytes)).Err()
					}
				}
			}

		}

		// 处理服务商子账号缓存得菜单信息
		repoPermissionSubclass := permission.RepoPermissionSubclass

		permissionsSubclassByMenuId, _ := repoPermissionSubclass.SubclassPermissionsByMenuId(ctx, req.PermissionsByMenuIdReq{
			MenuPk: int(opt.Pk),
		})

		for _, item := range permissionsSubclassByMenuId {
			rolePermissionRedisKey := fmt.Sprintf(subclass.RolePermissionSubclassRedis, item.SubRolePk)
			data := m.edge.Redis.HGet(ctx, rolePermissionRedisKey, appx.Code).Val()
			if len(data) > 0 {
				var redisMenu assembler.MenuAssemblers
				err = json.Unmarshal([]byte(data), &redisMenu)
				for index, menuAssembler := range redisMenu {
					if opt.Pk == menuAssembler.Pk {
						redisMenu[index] = assembler.MenuAssembler{
							AuthMenu: *updateMenu,
							AppCode:  appx.Code,
							AppName:  appx.Name,
							OrgName:  orgs[0].Name,
						}
						sort.Sort(
							assembler.MenuAssemblersWrapper{
								Menus: redisMenu,
								SortBy: func(p, q *assembler.MenuAssembler) bool {
									if p.ParentPk != q.ParentPk {
										return p.ParentPk < q.ParentPk // ParentPk 递增排序
									}
									if p.Type != q.Type {
										return p.Type < q.Type // Type 递增排序
									}
									return p.Sort < q.Sort // Sort 递增排序
								},
							},
						)
						menusBytes, _ := json.Marshal(redisMenu)
						_ = m.edge.Redis.HSet(ctx, rolePermissionRedisKey, appx.Code, string(menusBytes)).Err()
					}
				}

			}
		}

	}
	return updateMenuData, err
}

func (m adminService) DisableMenu(ctx context.Context, opt req.UpdateMenuStatusReq) error {
	m.edge.WithLog(ctx, errx.DisableMenu, opt)
	repoMenu := menu.RepoMenu

	if opt.Status == 2 {
		isUse := m.MenuIsUse(ctx, int(opt.Pk))
		if isUse {
			return fmt.Errorf("menu has role")
		}
	}
	// 查询该菜单下 所有子级菜单
	menuAssemblers, _ := repoMenu.MenusByParentId(ctx, req.MenuReq{Pk: int(opt.Pk)})
	for _, menuAssembler := range menuAssemblers {
		opt.Pks = append(opt.Pks, int(menuAssembler.Pk))
	}
	opt.Pks = append(opt.Pks, int(opt.Pk))
	opt.Pk = 0
	return repoMenu.UpdateMenuStatus(ctx, opt)

}

func (m adminService) EnableMenu(ctx context.Context, opt req.UpdateMenuStatusReq) error {
	m.edge.WithLog(ctx, errx.EnableMenu, opt)
	repoMenu := menu.RepoMenu
	// 查询该菜单下 所有子级菜单
	menuAssemblers, _ := repoMenu.MenusByParentId(ctx, req.MenuReq{Pk: int(opt.Pk)})
	for _, menuAssembler := range menuAssemblers {
		opt.Pks = append(opt.Pks, int(menuAssembler.Pk))
	}
	opt.Pks = append(opt.Pks, int(opt.Pk))
	opt.Pk = 0
	return repoMenu.UpdateMenuStatus(ctx, opt)
}

func (m adminService) DelMenu(ctx context.Context, opt req.UpdateMenuStatusReq) error {
	m.edge.WithLog(ctx, errx.DelMenu, opt)
	repoMenu := menu.RepoMenu
	if opt.Status == 3 {
		isUse := m.MenuIsUse(ctx, int(opt.Pk))
		if isUse {
			return fmt.Errorf("menu has role")
		}
	}
	// 查询该菜单下 所有子级菜单
	menuAssemblers, _ := repoMenu.MenusByParentId(ctx, req.MenuReq{Pk: int(opt.Pk)})
	for _, menuAssembler := range menuAssemblers {
		opt.Pks = append(opt.Pks, int(menuAssembler.Pk))
	}
	opt.Pks = append(opt.Pks, int(opt.Pk))
	opt.Pk = 0
	return repoMenu.UpdateMenuStatus(ctx, opt)
}

func (m adminService) GetMenuTree(ctx context.Context, opt req.MenuReq) (assembler.MenuTree, error) {
	repoMenu := menu.RepoMenu
	menusData, _, _ := repoMenu.Menus(ctx, opt)

	var CustomerMenusData assembler.CustomerMenus
	for _, item := range menusData {
		CustomerMenusData = append(CustomerMenusData, assembler.CustomerMenu{
			Pk:       int(item.Pk),
			ParentPk: int(item.ParentPk),
			Name:     item.Name,
			Joins:    item.Joins,
			Route:    item.Route,
			Icon:     item.Icon,
			OrgPk:    int(item.OrgPk),
			AppPk:    int(item.AppPk),
		})
	}

	tree := lib.GenerateTree(CustomerMenusData.ConvertToINodeArray(), nil)
	/*bytes, _ := json.MarshalIndent(resp, "", "\t")
	fmt.Println(string(bytes))*/

	return tree, nil
}

// MenuIsUse 查询菜单是否被角色使用
func (m adminService) MenuIsUse(ctx context.Context, menuPk int) bool {

	repoPermission := permission.RepoPermission
	repoPermissionSubclass := permission.RepoPermissionSubclass
	permissionsByMenuId, _ := repoPermission.PermissionsByMenuId(ctx, req.PermissionsByMenuIdReq{
		MenuPk: menuPk,
	})
	if len(permissionsByMenuId) > 0 {
		return true
	}
	// 菜单被服务商子账号角色使用
	permissionsSubclassByMenuId, _ := repoPermissionSubclass.SubclassPermissionsByMenuId(ctx, req.PermissionsByMenuIdReq{
		MenuPk: menuPk,
	})
	if len(permissionsSubclassByMenuId) > 0 {
		return true
	}
	return false
}
