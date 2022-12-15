package model

type SsoAccount struct {
	Pk          int32  `gorm:"pk" json:"pk"`
	Id          string `gorm:"id" json:"id"`                     // 对外ID
	AccountType string `gorm:"account_type" json:"account_type"` // 账户类型 0x01 员工 ，0x02 服务商，0x03 商户，0x04 消费者
	Mobile      string `gorm:"mobile" json:"mobile"`             // 手机号
	Pm          string `gorm:"pm" json:"pm"`                     // 派盟账户
	Dingtalk    string `gorm:"dingtalk" json:"dingtalk"`         // 钉钉账户
	Wechat      string `gorm:"wechat" json:"wechat"`             // 微信账户
	Github      string `gorm:"github" json:"github"`             // github
	Qq          string `gorm:"qq" json:"qq"`                     // qq
	Facebook    string `gorm:"facebook" json:"facebook"`
	Twitter     string `gorm:"twitter" json:"twitter"`
	Line        string `gorm:"line" json:"line"`
	Password    string `gorm:"password" json:"password"` // 登陆密码
	Secret      string `gorm:"secret" json:"secret"`     // 安全秘钥
}

func (*SsoAccount) TableName() string {
	return "sso_account"
}
