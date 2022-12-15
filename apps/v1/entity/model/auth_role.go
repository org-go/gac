package model

import "time"

type AuthRole struct {
	Pk          int32     `gorm:"pk" json:"pk"`
	Name        string    `gorm:"name" json:"name"`                 // 角色名称
	Code        string    `gorm:"code" json:"code"`                 // 角色代号
	Status      byte      `gorm:"status" json:"status"`             // 1:启用 2：禁用 3：删除
	Type        byte      `gorm:"type" json:"type"`                 // 角色类别 1:gac管理员 2：sass员工 3：sass服务商
	Remark      string    `gorm:"remark" json:"remark"`             // 备注
	CreatedTime time.Time `gorm:"created_time" json:"created_time"` // 创建时间
	UpdatedTime time.Time `gorm:"updated_time" json:"updated_time"` // 更新时间
	CreatedUser string    `gorm:"created_user" json:"created_user"` // 创建人
	CreatedIp   string    `gorm:"created_ip" json:"created_ip"`     // 创建Ip
}

func (*AuthRole) TableName() string {
	return "auth_role"
}
