package errx

import (
	"net/http"
	"payfun.gac.service/apps/v1/entity/assembler"
)

const (
	errRoleResponseNotName = "role"
)

var Roles *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errRoleResponseNotName,
	DescriptionField: `查询失败`,
	//CodeField:        `COMMON_TXT_00101`,
	CodeField:   `查询失败`,
	exposeDebug: false,
	cause:       nil,
}

var AddRole *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errRoleResponseNotName,
	DescriptionField: `创建失败`,
	CodeField:        `创建失败`,
	exposeDebug:      false,
	cause:            nil,
	log: log{
		Action: assembler.LogActionInsert,
		Module: assembler.LogModuleRole,
		Record: `添加角色:%s`,
	},
	lang: nil,
}

var UpdateRole *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errRoleResponseNotName,
	DescriptionField: `更新失败`,
	CodeField:        `更新失败`,
	exposeDebug:      false,
	cause:            nil,
	log: log{
		Action: assembler.LogActionUpdate,
		Module: assembler.LogModuleRole,
		Record: `更新角色:%s`,
	},
	lang: nil,
}

var DisableRole *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errRoleResponseNotName,
	DescriptionField: `启用/停用失败`,
	CodeField:        `启用/停用失败`,
	exposeDebug:      false,
	cause:            nil,
	log: log{
		Action: assembler.LogActionUpdate,
		Module: assembler.LogModuleRole,
		Record: `禁用角色:%s`,
	},
	lang: nil,
}

var EnableRole *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errRoleResponseNotName,
	DescriptionField: `启用/停用失败`,
	CodeField:        `启用/停用失败`,
	exposeDebug:      false,
	cause:            nil,
	log: log{
		Action: assembler.LogActionUpdate,
		Module: assembler.LogModuleRole,
		Record: `启用角色:%s`,
	},
	lang: nil,
}

var DelRole *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errRoleResponseNotName,
	DescriptionField: `删除失败`,
	CodeField:        `删除失败`,
	exposeDebug:      false,
	cause:            nil,
	log: log{
		Action: assembler.LogActionDelete,
		Module: assembler.LogModuleRole,
		Record: `删除角色:%s`,
	},
	lang: nil,
}

var RoleHasAccount *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errRoleResponseNotName,
	DescriptionField: `存在关联账户，禁止操作`,
	CodeField:        `存在关联账户，禁止操作`,
	//CodeField:   `该角色下存在账号`,
	exposeDebug: false,
	cause:       nil,
	lang:        nil,
}
