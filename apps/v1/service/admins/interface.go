package admins

import (
	"context"
	"payfun.gac.service/apps/v1/dto/common"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/dto/resp"
	"payfun.gac.service/apps/v1/entity/assembler"
	"payfun.gac.service/apps/v1/entity/model"
)

type (

	// iAdminSvcInterface
	iAdminSvcInterface interface {
		GetMenuPage(ctx context.Context, opt req.MenuReq) (assembler.MenuAssemblers, *common.PaginationResult, error)
		AddMenu(ctx context.Context, opt req.AddMenuReq) (*model.AuthMenu, error)
		UpdateMenu(ctx context.Context, opt req.UpdateMenuReq) (*model.AuthMenu, error)
		DisableMenu(ctx context.Context, opt req.UpdateMenuStatusReq) error
		EnableMenu(ctx context.Context, opt req.UpdateMenuStatusReq) error
		DelMenu(ctx context.Context, opt req.UpdateMenuStatusReq) error
		GetMenuTree(ctx context.Context, opt req.MenuReq) (assembler.MenuTree, error)

		GetRoles(ctx context.Context, opt req.RoleReq) (assembler.RoleAssemblers, *common.PaginationResult, error)
		GetRolePage(ctx context.Context, opt req.RolePageReq) (assembler.RoleAssemblers, *common.PaginationResult, error)
		AddRole(ctx context.Context, opt req.AddRoleReq) (*model.AuthRole, error)
		UpdateRole(ctx context.Context, opt req.UpdateRoleReq) (*model.AuthRole, error)
		DisableRole(ctx context.Context, opt req.UpdateRoleStatusReq) error
		EnableRole(ctx context.Context, opt req.UpdateRoleStatusReq) error
		DelRole(ctx context.Context, opt req.UpdateRoleStatusReq) error

		BindPermission(ctx context.Context, opt req.AddPermissionReq) error
		QueryPermission(ctx context.Context, opt req.QueryPermissionReq) (resp.QueryPermissionResp, error)
		DealPermissionRedis(ctx context.Context, opt req.AddPermissionReq) error
	}
)
