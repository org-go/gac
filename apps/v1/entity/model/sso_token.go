package model

import "time"

type SsoToken struct {
	Pk          int32     `gorm:"pk" json:"pk"`
	Type        string    `gorm:"type" json:"type"`                 // token 类型
	AccessToken string    `gorm:"access_token" json:"access_token"` // token
	OrgPk       int32     `gorm:"org_pk" json:"org_pk"`             // 组织id
	AppPk       int32     `gorm:"app_pk" json:"app_pk"`             // 应用id
	AccountId   int32     `gorm:"account_id" json:"account_id"`     // 用户id
	Code        string    `gorm:"code" json:"code"`                 // code
	CreatedTime time.Time `gorm:"created_time" json:"created_time"` // 创建时间
}

func (*SsoToken) TableName() string {
	return "sso_token"
}
