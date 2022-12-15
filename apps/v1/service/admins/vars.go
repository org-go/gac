package admins

import "payfun.gac.service/apps/v1/service"

type adminService struct {
	edge *service.Edge
}

func Svc() iAdminSvcInterface {
	return &adminService{service.Initialization()}
}

const (
	RolePermissionRedis    = `permission:role_%d`
	PermissionRoleAppRedis = `permission:app`
	GacAppCode             = `gac`
	GacAppPk               = 1
	GacOrgPk               = 1
)
