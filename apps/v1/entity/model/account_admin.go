package model

import "time"

type AccountAdmin struct {
	Pk            int32     `gorm:"pk" json:"pk"`
	AccountId     string    `gorm:"account_id" json:"account_id"`     // sso账号id
	RolePk        int32     `gorm:"role_pk" json:"role_pk"`           // 角色id
	Name          string    `gorm:"name" json:"name"`                 // 名称
	Account       string    `gorm:"account" json:"account"`           // 账户
	Status        byte      `gorm:"status" json:"status"`             // 状态：1:启用 2：停用  3:  删除
	CreatedTime   time.Time `gorm:"created_time" json:"created_time"` // 创建时间
	UpdatedTime   time.Time `gorm:"updated_time" json:"updated_time"` // 更新时间
	CreatedId     string    `gorm:"created_id" json:"created_id"`     // 创建管理ID
	CreatedUser   string    `gorm:"created_user" json:"created_user"`
	CreatedIp     string    `gorm:"created_ip" json:"created_ip"`           // 创建Ip
	LastLoginIp   string    `gorm:"last_login_ip" json:"last_login_ip"`     // 最后登陆ip
	LoginCount    int32     `gorm:"login_count" json:"login_count"`         // 登陆次数
	LastLoginTime time.Time `gorm:"last_login_time" json:"last_login_time"` // 最后登陆时间
	Mobile        string    `gorm:"mobile" json:"mobile"`                   // 手机号
	Password      string    `gorm:"password" json:"password"`               // 登陆密码
	Secret        string    `gorm:"secret" json:"secret"`                   // 安全秘钥
	IsAdmin       byte      `gorm:"is_admin" json:"is_admin"`               // 是否是超级管理员：1:是 0 否
}

func (*AccountAdmin) TableName() string {
	return "account_admin"
}
