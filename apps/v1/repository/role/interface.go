package role

import (
	"context"
	"payfun.gac.service/apps/v1/dto/common"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/entity/assembler"
	"payfun.gac.service/apps/v1/entity/model"
)

type (
	iRoleRepository interface {
		Roles(ctx context.Context, opt req.RolePageReq) (assembler.RoleAssemblers, *common.PaginationResult, error)
		Role(ctx context.Context, opt req.RoleReq) (assembler.RoleAssembler, error)
		AddRole(ctx context.Context, o *model.AuthRole) (*model.AuthRole, error)
		UpdateRole(ctx context.Context, o *model.AuthRole) (*model.AuthRole, error)
		UpdateRoleStatus(ctx context.Context, opt req.UpdateRoleStatusReq) error
	}
)

type (
	iRoleSubclassRepository interface {
		SubclassRoles(ctx context.Context, opt req.SubclassRolePageReq) (assembler.RoleSubclassAssemblers, *common.PaginationResult, error)
		SubclassRole(ctx context.Context, opt req.SubclassRoleReq) (assembler.RoleSubclassAssembler, error)
		AddSubclassRole(ctx context.Context, o *model.AuthRoleSubclass) (*model.AuthRoleSubclass, error)
		UpdateSubclassRole(ctx context.Context, o *model.AuthRoleSubclass) (*model.AuthRoleSubclass, error)
		UpdateSubclassRoleStatus(ctx context.Context, opt req.UpdateRoleStatusReq) error
	}
)
