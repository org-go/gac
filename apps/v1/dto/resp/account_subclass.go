package resp

import "time"

//
//  AccountSubclassResp
//  @Description:
//
type AccountSubclassResps []AccountSubclassResp
type AccountSubclassResp struct {
	SubRolePk     int32     `gorm:"sub_role_pk" json:"sub_role_pk"`         // 子账号角色id
	Id            string    `gorm:"id" json:"id"`                           // 对外ID
	Name          string    `gorm:"name" json:"name"`                       // 名称
	Account       string    `gorm:"account" json:"account"`                 // 账户
	Status        byte      `gorm:"status" json:"status"`                   // 状态：1:启用 2：停用 3:删除
	CreatedTime   time.Time `gorm:"created_time" json:"created_time"`       // 创建时间
	UpdatedTime   time.Time `gorm:"updated_time" json:"updated_time"`       // 更新时间
	CreatedIp     string    `gorm:"created_ip" json:"created_ip"`           // 创建Ip
	LastLoginIp   string    `gorm:"last_login_ip" json:"last_login_ip"`     // 最后登陆ip
	LoginCount    int32     `gorm:"login_count" json:"login_count"`         // 登陆次数
	LastLoginTime time.Time `gorm:"last_login_time" json:"last_login_time"` // 最后登陆时间
	CreatedUser   string    `gorm:"created_user" json:"created_user"`
}
