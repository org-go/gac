package assembler

import (
	"payfun.gac.service/apps/v1/entity/model"
)

type (
	RoleAssembler struct {
		model.AuthRole
	}
	RoleAssemblers []RoleAssembler

	RoleSubclassAssembler struct {
		model.AuthRoleSubclass
	}
	RoleSubclassAssemblers []RoleSubclassAssembler
)
