package accounts

import "payfun.gac.service/apps/v1/service"

// AdminSvc 内部员工
func AdminSvc() iActAdminSvcInterface {
	return &actAdmin{
		Salt: "[asr1.m)*",
		edge: service.Initialization(),
	}
}

// ProvdSvc 服务商
func ProvdSvc() iAcctProvSvcInterface {
	return &acctProvd{
		Salt: "[asr1.m)*",
		edge: service.Initialization(),
	}
}
