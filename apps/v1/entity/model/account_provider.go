package model

import "time"

type AccountProvider struct {
	Pk            int32     `gorm:"pk" json:"pk"`
	ProviderId    int32     `gorm:"provider_id" json:"provider_id"`         // 服务商id
	AccountId     string    `gorm:"account_id" json:"account_id"`           // sso账号id
	RolePk        int32     `gorm:"role_pk" json:"role_pk"`                 // 角色id
	Name          string    `gorm:"name" json:"name"`                       // 名称
	Account       string    `gorm:"account" json:"account"`                 // 账户
	Password      string    `gorm:"password" json:"password"`               // 登陆密码
	Secret        string    `gorm:"secret" json:"secret"`                   // 安全秘钥
	Status        byte      `gorm:"status" json:"status"`                   // 状态：1:启用 2：停用
	CreatedTime   time.Time `gorm:"created_time" json:"created_time"`       // 创建时间
	UpdatedTime   time.Time `gorm:"updated_time" json:"updated_time"`       // 更新时间
	CreatedIp     string    `gorm:"created_ip" json:"created_ip"`           // 创建Ip
	LastLoginIp   string    `gorm:"last_login_ip" json:"last_login_ip"`     // 最后登陆ip
	LoginCount    int32     `gorm:"login_count" json:"login_count"`         // 登陆次数
	LastLoginTime time.Time `gorm:"last_login_time" json:"last_login_time"` // 最后登陆时间
	CreatedUser   string    `gorm:"created_user" json:"created_user"`       // 创建人
}

func (*AccountProvider) TableName() string {
	return "account_provider"
}
