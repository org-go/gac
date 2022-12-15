package model

import "time"

type DcAiotCustomer struct {
	Id            int64     `gorm:"id" json:"id"`                       // 服务商id
	Name          string    `gorm:"name" json:"name"`                   // 服务商名称
	Shortname     string    `gorm:"shortname" json:"shortname"`         // 服务商简称
	Regcode       string    `gorm:"regcode" json:"regcode"`             // 服务商唯一标识码
	Type          int32     `gorm:"type" json:"type"`                   // 服务商类型1：无开发能力服务商
	Contact       string    `gorm:"contact" json:"contact"`             // 联系人
	Phone         string    `gorm:"phone" json:"phone"`                 // 手机号
	Addressdetail string    `gorm:"addressdetail" json:"addressdetail"` // 地址
	Email         string    `gorm:"email" json:"email"`                 // 邮箱
	Status        int32     `gorm:"status" json:"status"`               // 状态：0-禁用，1-启用
	Createddate   time.Time `gorm:"createddate" json:"createddate"`     // 创建时间
	Updateddate   time.Time `gorm:"updateddate" json:"updateddate"`     // 修改时间
}

func (*DcAiotCustomer) TableName() string {
	return "dc_aiot_customer"
}
