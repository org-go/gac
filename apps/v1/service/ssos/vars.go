package ssos

import "payfun.gac.service/apps/v1/service"

// SsoAcctSvc sso 账号
func SsoAcctSvc() Loginer {
	return &SsoAccount{
		edge: service.Initialization(),
	}
}
