package admins

import (
	"context"
	"encoding/json"
	"fmt"
	"payfun.gac.service/apps/errx"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/dto/resp"
	"payfun.gac.service/apps/v1/entity/assembler"
	"payfun.gac.service/apps/v1/entity/model"
	"payfun.gac.service/apps/v1/repository/menu"
	"payfun.gac.service/apps/v1/repository/permission"
	"payfun.gac.service/pkg/org.pm.sdk/lib"
	"sort"
	"strconv"
	"strings"
	"time"
)

func (m adminService) BindPermission(ctx context.Context, opt req.AddPermissionReq) error {
	m.edge.WithLog(ctx, errx.Bind, opt)
	repoPermission := permission.RepoPermission
	// 将原有权限禁用
	_ = repoPermission.UpdatePermissionStatus(ctx, req.UpdatePermissionStatusReq{
		RolePk: opt.RolePk,
		Status: 3,
	})

	// Redis key、Field key
	rolePermissionRedisKey := fmt.Sprintf(RolePermissionRedis, opt.RolePk)
	permissionRoleAppRedis := PermissionRoleAppRedis
	permissionRoleAppRedisFieldKey := strconv.Itoa(opt.RolePk)

	if len(opt.PermissionIds) > 0 {
		// 处理 PermissionIds
		splitPermissionIds := strings.Split(opt.PermissionIds, ",")
		removeDuplicates := lib.SliceRemoveDuplicates(splitPermissionIds)

		authPermissions := make([]interface{}, 0, len(removeDuplicates))
		permissionIds := strings.Join(removeDuplicates, ",")

		authPermissions = append(authPermissions, &model.AuthPermission{
			RolePk:        int32(opt.RolePk),
			PermissionIds: permissionIds,
			Status:        1,
			CreatedTime:   time.Now(),
			CreatedUser:   opt.CreatedUser,
			CreatedIp:     opt.CreatedIp,
		})

		err := repoPermission.BatchAddPermission(ctx, authPermissions)
		if err != nil {
			return err
		}

		_ = m.DealPermissionRedis(ctx, req.AddPermissionReq{
			RolePk: opt.RolePk,
			ActionPermissionReq: req.ActionPermissionReq{
				PermissionIds: permissionIds,
				Status:        1,
			},
		})

	} else {
		// 权限全部取消 处理缓存
		err := m.edge.Redis.Del(ctx, rolePermissionRedisKey).Err()
		if err != nil {
			fmt.Printf("all redis del %s err %s", rolePermissionRedisKey, err)
		}
		err = m.edge.Redis.HDel(ctx, permissionRoleAppRedis, permissionRoleAppRedisFieldKey).Err()
		if err != nil {
			fmt.Printf("all redis del %s err %s", permissionRoleAppRedisFieldKey, err)
		}
	}
	return nil
}

func (m adminService) QueryPermission(ctx context.Context, opt req.QueryPermissionReq) (resp.QueryPermissionResp, error) {
	repoPermission := permission.RepoPermission
	repoMenu := menu.RepoMenu
	permissionAssemblers, _ := repoPermission.Permissions(ctx, opt)
	var menuIds []int
	for _, item := range permissionAssemblers {
		splitPermissionIds := strings.Split(item.PermissionIds, ",")
		if len(splitPermissionIds) > 0 {
			for _, id := range splitPermissionIds {
				idInt, err := strconv.Atoi(id)
				if err == nil {
					menuIds = append(menuIds, idInt)
				}
			}
		}
	}
	queryPermissionResp := make(resp.QueryPermissionResp)
	if len(menuIds) > 0 {
		menus, _, err := repoMenu.Menus(ctx, req.MenuReq{
			Pks:    menuIds,
			Status: 1,
		})
		menusByAppPk := assembler.SplitMenusByAppPk(menus)

		for _, menusTemp := range menusByAppPk {
			appCode := menusTemp[0].AppCode
			queryPermissionResp[appCode] = menusTemp
		}
		return queryPermissionResp, err
	}
	return queryPermissionResp, nil
}

// DealPermissionRedis  处理权限缓存数据
func (m adminService) DealPermissionRedis(ctx context.Context, opt req.AddPermissionReq) error {

	repoMenu := menu.RepoMenu
	// 处理 PermissionIds
	splitPermissionIds := strings.Split(opt.PermissionIds, ",")

	var menuIds []int
	for _, id := range splitPermissionIds {
		idInt, err := strconv.Atoi(id)
		if err == nil {
			menuIds = append(menuIds, idInt)
		}
	}

	// Redis key、Field key
	rolePermissionRedisKey := fmt.Sprintf(RolePermissionRedis, opt.RolePk)
	permissionRoleAppRedis := PermissionRoleAppRedis
	permissionRoleAppRedisFieldKey := strconv.Itoa(opt.RolePk)
	go func() {
		if len(menuIds) > 0 {
			// 获取所有菜单数据
			menusAll, _, _ := repoMenu.Menus(ctx, req.MenuReq{
				Pks:    menuIds,
				Status: 1,
			})
			var permissionRoleApp []assembler.PermissionRoleApp
			// 按照app分组
			menusByAppPkSlice := assembler.SplitMenusByAppPk(menusAll)

			for _, menusByAppPk := range menusByAppPkSlice {

				if len(menusByAppPk) > 0 {
					filedKey := menusByAppPk[0].AppCode
					sort.Sort(
						assembler.MenuAssemblersWrapper{
							Menus: menusByAppPk,
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
					menusBytes, _ := json.Marshal(menusByAppPk)
					err := m.edge.Redis.HDel(ctx, rolePermissionRedisKey, filedKey).Err()
					if err != nil {
						fmt.Printf("redis del %s err %s", rolePermissionRedisKey, err)
					}
					err = m.edge.Redis.HSet(ctx, rolePermissionRedisKey, filedKey, string(menusBytes)).Err()
					if err != nil {
						fmt.Printf("redis set %s err %s", rolePermissionRedisKey, err)
					}

					permissionRoleApp = append(permissionRoleApp, assembler.PermissionRoleApp{
						Name:  menusByAppPk[0].AppName,
						Code:  menusByAppPk[0].AppCode,
						OrgPk: menusByAppPk[0].OrgPk,
					})

				}
			}

			permissionRoleAppBytes, _ := json.Marshal(permissionRoleApp)
			err := m.edge.Redis.HDel(ctx, permissionRoleAppRedis, permissionRoleAppRedisFieldKey).Err()
			if err != nil {
				fmt.Printf("redis del %s err %s", permissionRoleAppRedisFieldKey, err)
			}
			err = m.edge.Redis.HSet(ctx, permissionRoleAppRedis, permissionRoleAppRedisFieldKey, string(permissionRoleAppBytes)).Err()
			if err != nil {
				fmt.Printf("redis set %s err %s", permissionRoleAppRedisFieldKey, err)
			}

		}
	}()
	return nil
}
