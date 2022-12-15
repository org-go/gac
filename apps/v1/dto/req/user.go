package req

import (
	"regexp"
	"strings"

	"payfun.gac.service/apps/v1/dto/common"
)

const (
	// 1:手机号短信登录 2:手机号密码登录 3:line登录 4:twitter登陆 5:facebook登陆 6:wechat登陆
	MobileCode = iota + 1
	MobilePasswd
	Line
	Twitter
	Facebook
	Wechat
)

// QueryUserParams 用户查询参数
type QueryUserParams struct {
	LikeNickName string `form:"like_nick_name"` // 昵称（模糊）
	LikeMobile   string `form:"like_mobile"`    // 手机号（模糊）
	Mobile       string `form:"mobile"`         // 手机号
	Status       int    `form:"status"`         // 1 启用 2 禁用 3 锁定 启用状态; 可以随便操作， 禁用状态：不能登陆，  锁定状态：不能使用权益
	SearchParams string // OR 查询 mobile facebookID tweetID lineID
	common.PaginationParam
	ID string `form:"id"` // 用户ID
}

// User 用户信息
type User struct {
	ID           string `gorm:"id" json:"id"`
	NickName     string `gorm:"nick_name" json:"nick_name"`         // 昵称
	Logo         string `gorm:"logo" json:"logo"`                   // 头像
	Mobile       string `gorm:"mobile" json:"mobile"`               // 手机号
	Passwd       string `gorm:"passwd" json:"passwd"`               // 密码
	Remark       string `gorm:"remark" json:"remark"`               // 备注
	Status       byte   `gorm:"status" json:"status"`               // 1 启用 2 禁用 3 锁定 启用状态; 可以随便操作， 禁用状态：不能登陆，  锁定状态：不能使用权益
	TwitterId    string `gorm:"twitter_id" json:"twitter_id"`       // 三方表中twitter对应id
	LineId       string `gorm:"line_id" json:"line_id"`             // 三方表中line对应id
	FacebookId   string `gorm:"facebook_id" json:"facebook_id"`     // 三方表中facebook对应id
	WechatId     string `gorm:"wechat_id" json:"wechat_id"`         // 三方表中wechat对应id
	LoginType    int    `gorm:"login_type" json:"login_type"`       // 登陆方式 1:手机号短信登录，2:手机号密码登录 3:twitter登录 4:line登陆 5:facebook登陆 6:wechat登陆
	DiallingCode string `gorm:"dialling_code" json:"dialling_code"` // 区号

}

// RegisterID 注册所需ID 手机号或三方ID
func (u *User) RegisterID() string {
	switch {
	case u.Mobile != "":
		return u.Mobile
	case u.FacebookId != "":
		return u.FacebookId
	case u.TwitterId != "":
		return u.TwitterId
	case u.LineId != "":
		return u.LineId
	case u.WechatId != "":
		return u.WechatId
	default:
		return ""
	}
}

// GetThirdID 获取三方ID
func (u *User) GetThirdID() string {
	switch {
	case u.FacebookId != "":
		return u.FacebookId
	case u.TwitterId != "":
		return u.TwitterId
	case u.LineId != "":
		return u.LineId
	case u.WechatId != "":
		return u.WechatId
	default:
		return ""
	}
}

// SMSVerify 短信校验
type SMSVerify struct {
	Mobile       string `json:"mobile"`        // 手机号
	DiallingCode string `json:"dialling_code"` // 区号
}

// SMSLogin 短信登录
type SMSLogin struct {
	Mobile       string `json:"mobile"`        // 手机号
	Code         string `json:"code"`          // 验证码
	DiallingCode string `json:"dialling_code"` // 手机号区号
}

// AccountLogin 账户登录
type AccountLogin struct {
	Mobile      string `json:"mobile"`       // 手机号
	Account     string `json:"account"`      // 账号
	Password    string `json:"password"`     // 密码
	AccountType int    `json:"account_type"` // 账户类型 0x01 员工 ，0x02 服务商，0x03 商户，0x04 消费者
}

const (
	jp = `^(\+?81|0)\d{1,4}[ \-]?\d{1,4}[ \-]?\d{4}$`
	ch = `^1[3456789]{1}\d{9}$`
)

// Validate validate
func (s *SMSVerify) Validate() bool {
	mobile := strings.ReplaceAll(s.Mobile, "-", "")
	dcode := strings.TrimPrefix(s.DiallingCode, "+")
	s.Mobile = mobile

	var reg *regexp.Regexp
	switch {
	case dcode == "86":
		reg = regexp.MustCompile(ch)
		return reg.MatchString(mobile)
	case dcode == "81":
		reg = regexp.MustCompile(jp)
		return reg.MatchString(mobile)
	default:
		reg = regexp.MustCompile(jp)
		return reg.MatchString(mobile)
	}
}
