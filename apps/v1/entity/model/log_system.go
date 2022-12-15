package model

import "time"

type LogSystem struct {
	Pk          int32     `gorm:"pk" json:"pk"`
	OrgPk       int32     `gorm:"org_pk" json:"org_pk"`             // 组织
	AppPk       int32     `gorm:"app_pk" json:"app_pk"`             // 应用
	Module      string    `gorm:"module" json:"module"`             // 模块
	Action      string    `gorm:"action" json:"action"`             // 行为
	ActionUser  string    `gorm:"action_user" json:"action_user"`   // 操作人
	Record      string    `gorm:"record" json:"record"`             // 记录
	CreatedTime time.Time `gorm:"created_time" json:"created_time"` // 创建时间
	CreatedIp   string    `gorm:"created_ip" json:"created_ip"`     // ip
}

func (*LogSystem) TableName() string {
	return "log_system"
}
