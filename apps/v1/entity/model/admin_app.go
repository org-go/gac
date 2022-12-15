package model

import "time"

type AdminApp struct {
	Pk          int32     `gorm:"pk" json:"pk"`
	Id          string    `gorm:"id" json:"id"`
	Tag         string    `gorm:"tag" json:"tag"`               // app归属
	Name        string    `gorm:"name" json:"name"`             // 名称
	Code        string    `gorm:"code" json:"code"`             // code
	OrgPk       int32     `gorm:"org_pk" json:"org_pk"`         // 组织id
	ApiLogo     string    `gorm:"api_logo" json:"api_logo"`     // logo
	ApiHost     string    `gorm:"api_host" json:"api_host"`     // host
	ApiSecret   string    `gorm:"api_secret" json:"api_secret"` // secret
	Status      byte      `gorm:"status" json:"status"`         // 状态 1 启用 2 禁用 3 删除
	CreatedUser string    `gorm:"created_user" json:"created_user"`
	CreatedTime time.Time `gorm:"created_time" json:"created_time"`
	UpdatedTime time.Time `gorm:"updated_time" json:"updated_time"`
	Type        byte      `gorm:"type" json:"type"` // app类别 2：系统 3：服务商
}

func (*AdminApp) TableName() string {
	return "admin_app"
}
