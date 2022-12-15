package auths

import (
	"payfun.gac.service/apps/v1/entity/adapter"
	"payfun.gac.service/apps/v1/service"
)

func Svc() iAuthSvcInterface {
	return &authService{service.Initialization()}
}

var Authorized adapter.AuthAdapter


const (


	StrRedisAccountToken = `account:%s:%s`


)

