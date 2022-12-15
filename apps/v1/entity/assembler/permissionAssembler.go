package assembler

import (
	"payfun.gac.service/apps/v1/entity/model"
)

type (
	PermissionAssembler struct {
		model.AuthPermission
	}
	PermissionAssemblers []PermissionAssembler

	PermissionRoleApp struct {
		Name  string `gorm:"name" json:"name"`     // 权限名称
		Code  string `gorm:"code" json:"code"`     // 权限code
		OrgPk int32  `gorm:"org_pk" json:"org_pk"` // 组织
	}

	PermissionSubclassAssembler struct {
		model.AuthPermissionSubclass
	}
	PermissionSubclassAssemblers []PermissionSubclassAssembler

	PermissionSubclassRoleApp struct {
		Name  string `gorm:"name" json:"name"`     // 权限名称
		Code  string `gorm:"code" json:"code"`     // 权限code
		OrgPk int32  `gorm:"org_pk" json:"org_pk"` // 组织
	}
)
