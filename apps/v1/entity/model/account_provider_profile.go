package model

import "time"

type AccountProviderProfile struct {
	Id            int64     `gorm:"id" json:"id"`                         // 服务商id
	AccountId     string    `gorm:"account_id" json:"account_id"`         // sso账号id
	Name          string    `gorm:"name" json:"name"`                     // 服务商名称
	ShortName     string    `gorm:"short_name" json:"short_name"`         // 服务商简称
	RegCode       string    `gorm:"reg_code" json:"reg_code"`             // 服务商唯一标识码
	Type          int32     `gorm:"type" json:"type"`                     // 服务商类型1：无开发能力服务商
	Contact       string    `gorm:"contact" json:"contact"`               // 联系人
	Phone         string    `gorm:"phone" json:"phone"`                   // 手机号
	AddressDetail string    `gorm:"address_detail" json:"address_detail"` // 地址
	Email         string    `gorm:"email" json:"email"`                   // 邮箱
	CreatedTime   time.Time `gorm:"created_time" json:"created_time"`     // 创建时间
	UpdatedTime   time.Time `gorm:"updated_time" json:"updated_time"`     // 修改时间
}

func (*AccountProviderProfile) TableName() string {
	return "account_provider_profile"
}
