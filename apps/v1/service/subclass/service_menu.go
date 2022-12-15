package subclass

import (
	"context"
	"payfun.gac.service/apps/v1/dto/common"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/entity/assembler"
	"payfun.gac.service/apps/v1/repository/menu"
	"payfun.gac.service/apps/v1/repository/permission"
	"strconv"
	"strings"
)

func (m *subclassService) GetMenuPage(ctx context.Context, opt req.SubclassMenuReq) (assembler.MenuAssemblers, *common.PaginationResult, error) {
	repoPermission := permission.RepoPermission
	repoPermissionSubclass := permission.RepoPermissionSubclass
	repoMenu := menu.RepoMenu

	var menuIds []int
	if opt.Type == 1 {
		permissionAssemblers, _ := repoPermission.Permissions(ctx, req.QueryPermissionReq{
			RolePk: opt.RolePk,
		})
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
	} else {
		permissionAssemblers, _ := repoPermissionSubclass.SubclassPermissions(ctx, req.QuerySubclassPermissionReq{
			SubRolePk: opt.RolePk,
		})
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
	}

	if len(menuIds) > 0 {
		return repoMenu.Menus(ctx, req.MenuReq{
			PaginationParam: opt.PaginationParam,
			Pks:             menuIds,
			Status:          1,
		})

	}
	return assembler.MenuAssemblers{}, &common.PaginationResult{}, nil
}
