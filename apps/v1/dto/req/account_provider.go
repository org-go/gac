package req

// AccountProvider 服务d账号
type AccountProvider struct {
	Account     string `json:"account" binding:"required,gte=4,lte=20"` // 登录账号
	AccountName string `json:"account_name" binding:"required"`         // 账号名称
	Password    string `json:"password"`                                // 密码
	RolePK      int    `json:"role_pk"`                                 // 角色主键值
	Mobile      string `json:"mobile"`                                  // 手机号

	ProvdID   int    `json:"provd_id"`   // 服务商ID
	AccountID string `json:"account_id"` // 账户ID 更新时使用
}

// QueryAiotCustomerParams 查询aiot
type QueryAiotCustomerParams struct {
	LikeName string   `form:"like_name"` // 名称模糊查询
	NotIDs   []string `form:"-"`         // 非服务商ID列表
}

// AcctChangePasswd 修改密码
type AcctChangePasswd struct {
	OldPassword string `json:"old_password"` // 旧密码
	Password    string `json:"password"`     // 密码
}
