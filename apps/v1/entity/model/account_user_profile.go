package model

import "time"

type AccountUserProfile struct {
	Pk          int32     `gorm:"pk" json:"pk"`
	UserId      int32     `gorm:"user_id" json:"user_id"`           // 用户id
	Identity    string    `gorm:"identity" json:"identity"`         // 身份证
	Sex         int32     `gorm:"sex" json:"sex"`                   // 1:男 2:女 0：保密
	Age         int32     `gorm:"age" json:"age"`                   // 年龄
	Email       string    `gorm:"email" json:"email"`               // 邮箱
	Site        string    `gorm:"site" json:"site"`                 // 站点
	Company     string    `gorm:"company" json:"company"`           // 公司
	Work        string    `gorm:"work" json:"work"`                 // 职业
	Country     string    `gorm:"country" json:"country"`           // 国家
	Address     string    `gorm:"address" json:"address"`           // 地址
	CreatedTime time.Time `gorm:"created_time" json:"created_time"` // 创建时间
	UpdatedTime time.Time `gorm:"updated_time" json:"updated_time"` // 更新时间
	Ip          string    `gorm:"ip" json:"ip"`                     // 创建ip
}

func (*AccountUserProfile) TableName() string {
	return "account_user_profile"
}
