package errx

import (
	"net/http"
	"payfun.gac.service/apps/v1/entity/assembler"
)

const (
	errRoleSubclassResponseNotName = "role_subclass"
)

var SubclassRoles *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errRoleSubclassResponseNotName,
	DescriptionField: `查询失败`,
	CodeField:        `COMMON_TXT_00101`,
	//CodeField:   `查询失败`,
	exposeDebug: false,
	cause:       nil,
}

var AddSubclassRole *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errRoleSubclassResponseNotName,
	DescriptionField: `创建失败`,
	CodeField:        `COMMON_MSG_00004`,
	//CodeField:   `创建失败`,
	exposeDebug: false,
	cause:       nil,
	log: log{
		Action: assembler.LogActionInsert,
		Module: assembler.LogModuleRole,
		Record: `添加服务商子角色:%s`,
	},
	lang: nil,
}

var UpdateSubclassRole *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errRoleSubclassResponseNotName,
	DescriptionField: `更新失败`,
	CodeField:        `COMMON_MSG_00007`,
	//CodeField:   `更新失败`,
	exposeDebug: false,
	cause:       nil,
	log: log{
		Action: assembler.LogActionUpdate,
		Module: assembler.LogModuleRole,
		Record: `更新服务商子角色:%s`,
	},
	lang: nil,
}

var DisableSubclassRole *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errRoleSubclassResponseNotName,
	DescriptionField: `禁用/启用失败`,
	CodeField:        `COMMON_MSG_00002`,
	//CodeField:   `禁用/启用失败`,
	exposeDebug: false,
	cause:       nil,
	log: log{
		Action: assembler.LogActionUpdate,
		Module: assembler.LogModuleRole,
		Record: `禁用服务商子角色:%s`,
	},
	lang: nil,
}

var EnableSubclassRole *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errRoleSubclassResponseNotName,
	DescriptionField: `禁用/启用失败`,
	CodeField:        `COMMON_MSG_00002`,
	//CodeField:   `禁用/启用失败`,
	exposeDebug: false,
	cause:       nil,
	log: log{
		Action: assembler.LogActionUpdate,
		Module: assembler.LogModuleRole,
		Record: `启用服务商子角色:%s`,
	},
	lang: nil,
}

var DelSubclassRole *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errRoleSubclassResponseNotName,
	DescriptionField: `删除失败`,
	CodeField:        `COMMON_MSG_00002`,
	//CodeField:   `删除失败`,
	exposeDebug: false,
	cause:       nil,
	log: log{
		Action: assembler.LogActionDelete,
		Module: assembler.LogModuleRole,
		Record: `删除服务商子角色:%s`,
	},
	lang: nil,
}

var RoleHasSubclassAccount *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errRoleSubclassResponseNotName,
	DescriptionField: `存在关联账户，禁止操作`,
	CodeField:        `COMMON_MSG_00021`,
	//CodeField:   `该角色下存在账号`,
	exposeDebug: false,
	cause:       nil,
	lang:        nil,
}
