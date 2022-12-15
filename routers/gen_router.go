package routers

import (
	"github.com/xxjwxc/ginrpc"
)

func init() {
	ginrpc.SetVersion(1670563902)
	ginrpc.AddGenOne("OrgApi.Create", "/admin/org/create", []string{"POST"})
	ginrpc.AddGenOne("OrgApi.Delete", "/admin/org/delete", []string{"POST"})
	ginrpc.AddGenOne("OrgApi.Option", "/admin/org/option", []string{"GET"})
	ginrpc.AddGenOne("OrgApi.Orgs", "/admin/org/page", []string{"POST"})
	ginrpc.AddGenOne("OrgApi.Update", "/admin/org/update", []string{"POST"})
	ginrpc.AddGenOne("AppApi.Apps", "/admin/app/page", []string{"POST"})
	ginrpc.AddGenOne("AppApi.Create", "/admin/app/create", []string{"POST"})
	ginrpc.AddGenOne("AppApi.Delete", "/admin/app/delete", []string{"POST"})
	ginrpc.AddGenOne("AppApi.Disable", "/admin/app/disable", []string{"POST"})
	ginrpc.AddGenOne("AppApi.Option", "/admin/app/option", []string{"POST"})
	ginrpc.AddGenOne("AppApi.Update", "/admin/app/update", []string{"POST"})
	ginrpc.AddGenOne("AuthApi.Me", "/admin/auth/my_permission", []string{"POST"})
	ginrpc.AddGenOne("MenuApi.Create", "/admin/menu/create", []string{"POST"})
	ginrpc.AddGenOne("MenuApi.Delete", "/admin/menu/delete", []string{"POST"})
	ginrpc.AddGenOne("MenuApi.Disable", "/admin/menu/disable", []string{"POST"})
	ginrpc.AddGenOne("MenuApi.Page", "/admin/menu/page", []string{"POST"})
	ginrpc.AddGenOne("MenuApi.Tree", "/admin/menu/tree", []string{"POST"})
	ginrpc.AddGenOne("MenuApi.Update", "/admin/menu/update", []string{"POST"})
	ginrpc.AddGenOne("RoleApi.Create", "/admin/role/create", []string{"POST"})
	ginrpc.AddGenOne("RoleApi.Delete", "/admin/role/delete", []string{"POST"})
	ginrpc.AddGenOne("RoleApi.Disable", "/admin/role/disable", []string{"POST"})
	ginrpc.AddGenOne("RoleApi.Option", "/admin/role/option", []string{"POST"})
	ginrpc.AddGenOne("RoleApi.Page", "/admin/role/page", []string{"POST"})
	ginrpc.AddGenOne("RoleApi.Update", "/admin/role/update", []string{"POST"})
	ginrpc.AddGenOne("PermissionApi.Create", "/admin/permission/create", []string{"POST"})
	ginrpc.AddGenOne("PermissionApi.Menus", "/admin/permission/menus", []string{"POST"})
	ginrpc.AddGenOne("PermissionApi.Query", "/admin/permission/query", []string{"POST"})
	ginrpc.AddGenOne("StaffRoleApi.Create", "/admin/staff_role/create", []string{"POST"})
	ginrpc.AddGenOne("StaffRoleApi.Delete", "/admin/staff_role/delete", []string{"POST"})
	ginrpc.AddGenOne("StaffRoleApi.Disable", "/admin/staff_role/disable", []string{"POST"})
	ginrpc.AddGenOne("StaffRoleApi.Page", "/admin/staff_role/page", []string{"POST"})
	ginrpc.AddGenOne("StaffRoleApi.Update", "/admin/staff_role/update", []string{"POST"})
	ginrpc.AddGenOne("StaffPermissionApi.Create", "/admin/staff_permission/create", []string{"POST"})
	ginrpc.AddGenOne("StaffPermissionApi.Menus", "/admin/staff_permission/menus", []string{"POST"})
	ginrpc.AddGenOne("StaffPermissionApi.Query", "/admin/staff_permission/query", []string{"POST"})
	ginrpc.AddGenOne("ServiceRoleApi.Create", "/admin/service_role/create", []string{"POST"})
	ginrpc.AddGenOne("ServiceRoleApi.Delete", "/admin/service_role/delete", []string{"POST"})
	ginrpc.AddGenOne("ServiceRoleApi.Disable", "/admin/service_role/disable", []string{"POST"})
	ginrpc.AddGenOne("ServiceRoleApi.Page", "/admin/service_role/page", []string{"POST"})
	ginrpc.AddGenOne("ServiceRoleApi.Update", "/admin/service_role/update", []string{"POST"})
	ginrpc.AddGenOne("ServicePermissionApi.Create", "/admin/service_permission/create", []string{"POST"})
	ginrpc.AddGenOne("ServicePermissionApi.Menus", "/admin/service_permission/menus", []string{"POST"})
	ginrpc.AddGenOne("ServicePermissionApi.Query", "/admin/service_permission/query", []string{"POST"})
	ginrpc.AddGenOne("AdminAPI.Create", "/admin/accounts/create", []string{"POST"})
	ginrpc.AddGenOne("AdminAPI.Delete", "/admin/accounts/delete", []string{"POST"})
	ginrpc.AddGenOne("AdminAPI.Disable", "/admin/accounts/disable", []string{"POST"})
	ginrpc.AddGenOne("AdminAPI.Get", "admin_api.get", []string{"get"})
	ginrpc.AddGenOne("AdminAPI.Login", "/admin/login", []string{"POST"})
	ginrpc.AddGenOne("AdminAPI.Query", "/admin/accounts/page", []string{"GET"})
	ginrpc.AddGenOne("AdminAPI.ResetPassword", "/admin/accounts/reset_password", []string{"POST"})
	ginrpc.AddGenOne("AdminAPI.Update", "/admin/accounts/update", []string{"POST"})
	ginrpc.AddGenOne("LogApi.Action", "/admin/log/action_option", []string{"GET"})
	ginrpc.AddGenOne("LogApi.Logs", "/admin/log/page", []string{"POST"})
	ginrpc.AddGenOne("LogApi.Module", "/admin/log/module_option", []string{"GET"})
	ginrpc.AddGenOne("ProvdAPI.Create", "/admin/provd/accounts/create", []string{"POST"})
	ginrpc.AddGenOne("ProvdAPI.Delete", "/admin/provd/accounts/delete", []string{"POST"})
	ginrpc.AddGenOne("ProvdAPI.Disable", "/admin/provd/accounts/disable", []string{"POST"})
	ginrpc.AddGenOne("ProvdAPI.Get", "provd_api.get", []string{"get"})
	ginrpc.AddGenOne("ProvdAPI.Query", "/admin/provd/accounts/page", []string{"GET"})
	ginrpc.AddGenOne("ProvdAPI.QueryList", "/admin/provd/provider/list", []string{"GET"})
	ginrpc.AddGenOne("ProvdAPI.ResetPassword", "/admin/provd/provider/reset_password", []string{"POST"})
	ginrpc.AddGenOne("ProvdAPI.Update", "/admin/provd/accounts/update", []string{"POST"})
	ginrpc.AddGenOne("EnterpriseAPI.Create", "/admin/enterprise/accounts/create", []string{"POST"})
	ginrpc.AddGenOne("EnterpriseAPI.Delete", "/admin/enterprise/accounts/delete", []string{"POST"})
	ginrpc.AddGenOne("EnterpriseAPI.Disable", "/admin/enterprise/accounts/disable", []string{"POST"})
	ginrpc.AddGenOne("EnterpriseAPI.Get", "enterprise_api.get", []string{"get"})
	ginrpc.AddGenOne("EnterpriseAPI.Query", "/admin/enterprise/accounts/page", []string{"GET"})
	ginrpc.AddGenOne("EnterpriseAPI.ResetPassword", "/admin/enterprise/accounts/reset_password", []string{"POST"})
	ginrpc.AddGenOne("EnterpriseAPI.Update", "/admin/enterprise/accounts/update", []string{"POST"})
	ginrpc.AddGenOne("SsoAuthApi.Info", "/sso/auth/subclass/info", []string{"GET"})
	ginrpc.AddGenOne("SsoAuthApi.Me", "/sso/auth/my_permission", []string{"POST"})
	ginrpc.AddGenOne("SsoAuthApi.Password", "/sso/auth/subclass/rest_password", []string{"POST"})
	ginrpc.AddGenOne("SsoAuthApi.Platform", "/sso/auth/platform/info", []string{"GET"})
	ginrpc.AddGenOne("SsoAuthApi.Provider", "/sso/auth/provider/info", []string{"GET"})
	ginrpc.AddGenOne("SsoAuthApi.Sso", "/sso/auth/passport", []string{"POST"})
	ginrpc.AddGenOne("SsoAuthApi.Update", "/sso/auth/platform/update", []string{"POST"})
	ginrpc.AddGenOne("SsoAuthApi.UpdatePassword", "/sso/auth/platform/update_password", []string{"POST"})
	ginrpc.AddGenOne("SsoAccountSubclassApi.BindRole", "/sso/subclass/bind_role", []string{"POST"})
	ginrpc.AddGenOne("SsoAccountSubclassApi.Create", "/sso/subclass/create", []string{"POST"})
	ginrpc.AddGenOne("SsoAccountSubclassApi.Delete", "/sso/subclass/delete", []string{"POST"})
	ginrpc.AddGenOne("SsoAccountSubclassApi.Disable", "/sso/subclass/disable", []string{"POST"})
	ginrpc.AddGenOne("SsoAccountSubclassApi.Page", "/sso/subclass/page", []string{"POST"})
	ginrpc.AddGenOne("SsoAccountSubclassApi.Update", "/sso/auth/subclass/update", []string{"POST"})
	ginrpc.AddGenOne("SsoPermissionApi.Create", "/sso/permission/create", []string{"POST"})
	ginrpc.AddGenOne("SsoPermissionApi.Query", "/sso/permission/query", []string{"POST"})
	ginrpc.AddGenOne("SsoMenuApi.Page", "/sso/menu/page", []string{"POST"})
	ginrpc.AddGenOne("SsoRoleApi.Create", "/sso/role/create", []string{"POST"})
	ginrpc.AddGenOne("SsoRoleApi.Delete", "/sso/role/delete", []string{"POST"})
	ginrpc.AddGenOne("SsoRoleApi.Disable", "/sso/role/disable", []string{"POST"})
	ginrpc.AddGenOne("SsoRoleApi.Option", "/sso/role/option", []string{"POST"})
	ginrpc.AddGenOne("SsoRoleApi.Page", "/sso/role/page", []string{"POST"})
	ginrpc.AddGenOne("SsoRoleApi.Update", "/sso/role/update", []string{"POST"})
	ginrpc.AddGenOne("SsoAccountApi.Login", "/sso/account/login", []string{"POST"})
	ginrpc.AddGenOne("SsoAccountApi.ProvdLogin", "/sso/account/provd_login", []string{"POST"})
}
