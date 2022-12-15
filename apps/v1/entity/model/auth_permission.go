package model

import "time"

type AuthPermission struct {
	Pk            int32     `gorm:"pk" json:"pk"`
	RolePk        int32     `gorm:"role_pk" json:"role_pk"`               // 角色Id
	PermissionIds string    `gorm:"permission_ids" json:"permission_ids"` // 菜单Id
	Sort          int32     `gorm:"sort" json:"sort"`                     // 排序
	Status        byte      `gorm:"status" json:"status"`                 // 状态：1:启用 2：禁用 3：删除
	Module        string    `gorm:"module" json:"module"`                 // 字段权限补充
	CreatedTime   time.Time `gorm:"created_time" json:"created_time"`
	UpdatedTime   time.Time `gorm:"updated_time" json:"updated_time"`
	CreatedUser   string    `gorm:"created_user" json:"created_user"` // 创建人
	CreatedIp     string    `gorm:"created_ip" json:"created_ip"`     // 创建者Ip
}

func (*AuthPermission) TableName() string {
	return "auth_permission"
}
