package req

type AddPermissionReq struct {
	RolePk int `gorm:"role_pk" json:"role_pk" binding:"required,min=1"` // role_pk
	ActionPermissionReq
	CreatedUser string `gorm:"created_user" json:"created_user"` // 创建人
	CreatedIp   string `gorm:"created_ip" json:"created_ip"`     // 创建者Ip
}

type ActionPermissionReq struct {
	PermissionIds string `gorm:"permission_ids" json:"permission_ids" `               // 菜单Ids 多个逗号隔开
	Status        byte   `gorm:"status" json:"status" binding:"required,oneof=1 2 3"` // 状态：1:启用 2：停用  3:删除
}
type UpdatePermissionStatusReq struct {
	RolePk int  `gorm:"role_pk" json:"role_pk" binding:"min=1"`              // role_pk
	Status byte `gorm:"status" json:"status" binding:"required,oneof=1 2 3"` // 状态：1:启用 2：停用  3:  删除
}

type QueryPermissionReq struct {
	RolePk int `gorm:"role_pk" json:"role_pk" binding:"required,min=1"` // role_pk
}

type PermissionsByMenuIdReq struct {
	MenuPk int `gorm:"menu_pk" json:"menu_pk"` // menu_pk
}

type AddSubclassPermissionReq struct {
	SubRolePk int `gorm:"sub_role_pk" json:"sub_role_pk" binding:"required,min=1"` // sub_role_pk
	ActionPermissionReq
	CreatedUser string `gorm:"created_user" json:"created_user"` // 创建人
	CreatedIp   string `gorm:"created_ip" json:"created_ip"`     // 创建者Ip
}

type UpdateSubclassPermissionStatusReq struct {
	SubRolePk int  `gorm:"sub_role_pk" json:"sub_role_pk" binding:"min=1"`      // sub_role_pk
	Status    byte `gorm:"status" json:"status" binding:"required,oneof=1 2 3"` // 状态：1:启用 2：停用  3:  删除
}

type QuerySubclassPermissionReq struct {
	SubRolePk int `gorm:"sub_role_pk" json:"sub_role_pk" binding:"min=1"` // sub_role_pk
}
