package model

import "time"

type AdminOrg struct {
	Pk          int32     `gorm:"pk" json:"pk"`
	Name        string    `gorm:"name" json:"name"`         // 组织名称
	Code        string    `gorm:"code" json:"code"`         // 组织code
	Type        string    `gorm:"type" json:"type"`         // 组织类型
	Icon        string    `gorm:"icon" json:"icon"`         // icon链接
	Site        string    `gorm:"site" json:"site"`         // 站点
	Status      byte      `gorm:"status" json:"status"`     // 状态 1 启用 2 禁用 3 删除
	Contacts    string    `gorm:"contacts" json:"contacts"` // 联系人
	Mobile      string    `gorm:"mobile" json:"mobile"`     // 电话
	CreatedUser string    `gorm:"created_user" json:"created_user"`
	CreatedTime time.Time `gorm:"created_time" json:"created_time"`
	UpdatedTime time.Time `gorm:"updated_time" json:"updated_time"`
}

func (*AdminOrg) TableName() string {
	return "admin_org"
}
