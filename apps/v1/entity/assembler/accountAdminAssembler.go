package assembler

import "payfun.gac.service/apps/v1/entity/model"

type (
	// AccountAdmin 内部用户
	AccountAdmin struct {
		model.AccountAdmin
		CreatorName        string `json:"creator_name" gorm:"column:creator_name"`                 // 创建人名称
		CreatorAccountType string `json:"creator_account_type" gorm:"column:creator_account_type"` // 创建人账户类别(A:超管 B:管理员 C:员工)
		RoleName           string `json:"role_name" gorm:"column:role_name"`                       // 角色名称
		RoleType           string `json:"role_type" gorm:"column:role_type"`                       // 角色类型
		AccountType        int    `json:"account_type" gorm:"column:account_type"`                 // 账户类型
	}

	// AccountAdmins 内部用户列表
	AccountAdmins []AccountAdmin
)
