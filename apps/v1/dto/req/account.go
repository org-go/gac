package req

import "payfun.gac.service/apps/v1/dto/common"

// AccountAdmin 内部账号
type AccountAdmin struct {
	Account     string `json:"account" binding:"required,gte=4,lte=20"` // 登录账号
	AccountName string `json:"account_name" binding:"required"`         // 账号名称
	Password    string `json:"password"`                                // 密码
	RolePK      int    `json:"role_pk"`                                 // 角色主键值
	Mobile      string `json:"mobile"`                                  // 手机号

	AccountID string `json:"account_id"` // 账户ID 更新时使用
}

// QueryAccountParams 账号查询参数
type QueryAccountParams struct {
	common.PaginationParam
	LikeAccountName    string `form:"like_account_name"`    // 账号名称模糊查询
	Account            string `form:"account"`              // 登录账号
	RolePK             int    `form:"role_pk"`              // 角色主键
	CreatorName        string `form:"creator_name"`         // 创建人名称
	CreatorAccountType string `form:"creator_account_type"` // 创建人账户类别(A:超管 B:管理员 C:员工)
	Status             int    `form:"status"`               // 状态：1:启用 2：停用
	RoleType           int    `form:"role_type"`            // 角色类别 1:gac管理员 2：sass员工 3：sass服务商
}

// QueryProvdAccountParams 查询服务商账户
type QueryProvdAccountParams struct {
	QueryAccountParams
	ProvdID int `form:"provd_id" json:"provd_id"`
}

// AccountOperation 账户操作
type AccountOperation struct {
	AccountID string `json:"account_id" binding:"required"` // 账号ID
	Status    int    `json:"status"`                        // 状态：1:启用 2：停用
}

// ResetAccount 重置密码
type ResetAccount struct {
	AccountID string `json:"account_id"` // 账户ID
}

// UpdateAccountAdmin 内部账号
type UpdateAccountAdmin struct {
	AccountName string `json:"account_name"` // 账号名称
	RolePK      int    `json:"role_pk"`      // 角色主键值
	Mobile      string `json:"mobile"`       // 手机号
	// Password    string `json:"password"`                        // 密码

	AccountID string `json:"account_id"` // 账户ID 更新时使用
}
