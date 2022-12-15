package assembler

import "payfun.gac.service/apps/v1/entity/model"

type (
	// SsoAccount 单条
	SsoAccount struct {
		model.SsoAccount
	}
	// SsoAccounts 列表
	SsoAccounts []SsoAccount
)
