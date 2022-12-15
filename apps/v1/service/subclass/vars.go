package subclass

import "payfun.gac.service/apps/v1/service"

type subclassService struct {
	edge *service.Edge
	Salt string
}

func Svc() iSubclassSvcInterface {
	return &subclassService{
		edge: service.Initialization(),
		Salt: "[asr1.m)*",
	}
}

const (
	RolePermissionSubclassRedis    = `permission_subclass:role_subclass_%d`
	PermissionSubclassRoleAppRedis = `permission_subclass:app`
)
