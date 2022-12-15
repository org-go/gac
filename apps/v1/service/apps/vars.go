package apps

import "payfun.gac.service/apps/v1/service"

func Svc() iAppSvcInterface {
	return &appService{service.Initialization()}
}
