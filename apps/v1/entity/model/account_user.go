package model

import "time"

type AccountUser struct {
	Pk            int32     `gorm:"pk" json:"pk"`
	Id            string    `gorm:"id" json:"id"`                   // 对外暴漏用户id
	NickName      string    `gorm:"nick_name" json:"nick_name"`     // 昵称
	Logo          string    `gorm:"logo" json:"logo"`               // 头像
	Mobile        string    `gorm:"mobile" json:"mobile"`           // 手机号
	Passwd        string    `gorm:"passwd" json:"passwd"`           // 密码
	Remark        string    `gorm:"remark" json:"remark"`           // 备注
	Status        byte      `gorm:"status" json:"status"`           // 1 启用 2 禁用 3 锁定 启用状态; 可以随便操作， 禁用状态：不能登陆，  锁定状态：不能使用权益
	TwitterId     string    `gorm:"twitter_id" json:"twitter_id"`   // 三方表中twitter对应id
	LineId        string    `gorm:"line_id" json:"line_id"`         // 三方表中line对应id
	FacebookId    string    `gorm:"facebook_id" json:"facebook_id"` // 三方表中facebook对应id
	WechatId      string    `gorm:"wechat_id" json:"wechat_id"`     // 三方表中wechat对应id
	Score         int64     `gorm:"score" json:"score"`             // 当前积分
	TotalScore    int64     `gorm:"total_score" json:"total_score"` // 总积分
	Exp           int64     `gorm:"exp" json:"exp"`                 // 经验值
	LevelPk       int32     `gorm:"level_pk" json:"level_pk"`       // 当前等级
	CreatedTime   time.Time `gorm:"created_time" json:"created_time"`
	UpdatedTime   time.Time `gorm:"updated_time" json:"updated_time"`
	RegistedTime  time.Time `gorm:"registed_time" json:"registed_time"`     // 注册时间
	RegistedType  int32     `gorm:"registed_type" json:"registed_type"`     // 注册方式 1:手机号短信 2:手机号密码 3:twitter 4:line 5:facebook 6:wechat
	Platform      string    `gorm:"platform" json:"platform"`               // 平台
	DiallingCode  string    `gorm:"dialling_code" json:"dialling_code"`     // 电话区号
	LastLoginTime time.Time `gorm:"last_login_time" json:"last_login_time"` // 最后登陆时间
	LastLoginIp   string    `gorm:"last_login_ip" json:"last_login_ip"`     // 最后登陆IP
}

func (*AccountUser) TableName() string {
	return "account_user"
}
