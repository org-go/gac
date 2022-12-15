package permission

import (
	"context"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/entity/assembler"
	"payfun.gac.service/apps/v1/entity/model"
)

type (
	iPermissionRepository interface {
		AddPermission(ctx context.Context, o model.AuthPermission) (model.AuthPermission, error)
		BatchAddPermission(ctx context.Context, o []interface{}) error
		UpdatePermission(ctx context.Context, o model.AuthPermission) (model.AuthPermission, error)
		UpdatePermissionStatus(ctx context.Context, opt req.UpdatePermissionStatusReq) error
		Permissions(ctx context.Context, opt req.QueryPermissionReq) (assembler.PermissionAssemblers, error)
		PermissionsByMenuId(ctx context.Context, opt req.PermissionsByMenuIdReq) (assembler.PermissionAssemblers, error)
	}

	iPermissionSubclassRepository interface {
		AddSubclassPermission(ctx context.Context, o model.AuthPermissionSubclass) (model.AuthPermissionSubclass, error)
		BatchAddSubclassPermission(ctx context.Context, o []interface{}) error
		UpdateSubclassPermission(ctx context.Context, o model.AuthPermissionSubclass) (model.AuthPermissionSubclass, error)
		UpdateSubclassPermissionStatus(ctx context.Context, opt req.UpdateSubclassPermissionStatusReq) error
		SubclassPermissions(ctx context.Context, opt req.QuerySubclassPermissionReq) (assembler.PermissionSubclassAssemblers, error)
		SubclassPermissionsByMenuId(ctx context.Context, opt req.PermissionsByMenuIdReq) (assembler.PermissionSubclassAssemblers, error)
	}
)
