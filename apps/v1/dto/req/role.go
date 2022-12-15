package req

import (
	"payfun.gac.service/apps/v1/dto/common"
)

type RolePageReq struct {
	common.PaginationParam
	RoleReq
}

type RoleReq struct {
	Pk          int32  `json:"pk"`           // pk
	Name        string `json:"name"`         // 角色名称
	Type        int    `json:"type"`         // 角色类别 1:管理员 2：普通用户 3： 服务商
	Status      int    `json:"status"`       // 状态：1:启用 2：停用  3:  删除
	CreatedUser string `json:"created_user"` // 创建人名称
}

type UpdateRoleReq struct {
	Pk int32 `gorm:"pk" json:"pk" binding:"min=1"` // Pk
	ActionRoleReq
}

type AddRoleReq struct {
	ActionRoleReq
}

type ActionRoleReq struct {
	Name        string `gorm:"name" json:"name" binding:"required,gte=1,lte=30"`    // 角色名称
	Code        string `gorm:"code" json:"code"`                                    // 角色code
	Type        byte   `gorm:"type" json:"type" binding:"required,oneof=1 2 3"`     // 角色类别 1:管理员 2：普通用户 3： 服务商
	Status      byte   `gorm:"status" json:"status" binding:"required,oneof=1 2 3"` // 状态：1:启用 2：停用  3:  删除
	Remark      string `gorm:"remark" json:"remark"`
	CreatedUser string `gorm:"created_user" json:"created_user"` // 创建人
	CreatedIp   string `gorm:"created_ip" json:"created_ip"`     // 创建者Ip
}

type UpdateRoleStatusReq struct {
	Pk          int32  `gorm:"pk" json:"pk" binding:"min=1"`                        // Pk
	Status      byte   `gorm:"status" json:"status" binding:"required,oneof=1 2 3"` // 状态：1:启用 2：停用
	CreatedUser string `gorm:"created_user" json:"created_user"`                    // 创建人
	CreatedIp   string `gorm:"created_ip" json:"created_ip"`                        // 创建者Ip
}

type SubclassRolePageReq struct {
	common.PaginationParam
	SubclassRoleReq
}

type SubclassRoleReq struct {
	Pk          int32  `json:"pk"`           // pk
	Name        string `json:"name"`         // 角色名称
	Status      int    `json:"status"`       // 状态：1:启用 2：停用  3:  删除
	CreatedUser string `json:"created_user"` // 创建人名称
	AccountId   string `json:"account_id"`   // sso账号id
}

type UpdateSubclassRoleReq struct {
	Pk int32 `gorm:"pk" json:"pk" binding:"min=1"` // Pk
	ActionSubclassRoleReq
}

type AddSubclassRoleReq struct {
	ActionSubclassRoleReq
}

type ActionSubclassRoleReq struct {
	Name        string `gorm:"name" json:"name" binding:"required,gte=1,lte=30"`    // 角色名称
	Code        string `gorm:"code" json:"code"`                                    // 角色code
	Status      byte   `gorm:"status" json:"status" binding:"required,oneof=1 2 3"` // 状态：1:启用 2：停用  3:  删除
	Remark      string `gorm:"remark" json:"remark"`
	AccountId   string `gorm:"account_id" json:"account_id"`     // sso账号id
	CreatedUser string `gorm:"created_user" json:"created_user"` // 创建人
	CreatedIp   string `gorm:"created_ip" json:"created_ip"`     // 创建者Ip
}
