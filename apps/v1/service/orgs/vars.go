package orgs

import "payfun.gac.service/apps/v1/service"

func Svc() iOrgSvcInterface {
	return &orgService{service.Initialization()}
}
