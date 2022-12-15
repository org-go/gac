package assembler

import "payfun.gac.service/apps/v1/entity/model"

type (
	// AccountProvider 服务商
	AccountProvider struct {
		model.AccountProvider
		RoleName      string `json:"role_name" gorm:"column:role_name"`           // 角色名称
		AccountType   int    `json:"account_type" gorm:"column:account_type"`     // 账户类别 		Contact       string `json:"contact" gorm:"column:contact"`               // 联系人
		Phone         string `json:"phone" gorm:"column:phone"`                   // 手机号
		AddressDetail string `json:"address_detail" gorm:"column:address_detail"` // 地址详情
		Email         string `json:"email" gorm:"column:email"`                   // 电子邮箱
	}

	// AccountProviders 内部用户列表
	AccountProviders []AccountProvider
)

type (
	// DcAiotCustomer aiot服务商
	DcAiotCustomer struct {
		model.DcAiotCustomer
	}
	// DcAiotCustomers aiot服务商列表
	DcAiotCustomers []DcAiotCustomer
)
