package errx

import (
	"net/http"
	"payfun.gac.service/apps/v1/entity/assembler"
)

const (
	errMenuResponseNotName = "menu"
)

var Menus *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errMenuResponseNotName,
	DescriptionField: `查询失败`,
	//CodeField:        `COMMON_TXT_00101`,
	CodeField:   `查询失败`,
	exposeDebug: false,
	cause:       nil,
}

var AddMenu *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errMenuResponseNotName,
	DescriptionField: `提交失败`,
	//CodeField:        `COMMON_MSG_00002`,
	CodeField:   `提交失败`,
	exposeDebug: false,
	cause:       nil,
	log: log{
		Action: assembler.LogActionInsert,
		Module: assembler.LogModuleMenu,
		Record: `添加菜单:%s`,
	},
	lang: nil,
}

var UpdateMenu *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errMenuResponseNotName,
	DescriptionField: `更新失败`,
	//CodeField:        `COMMON_MSG_00007`,
	CodeField:   `更新失败`,
	exposeDebug: false,
	cause:       nil,
	log: log{
		Action: assembler.LogActionUpdate,
		Module: assembler.LogModuleMenu,
		Record: `更新菜单:%s`,
	},
	lang: nil,
}

var DisableMenu *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errMenuResponseNotName,
	DescriptionField: `禁用失败`,
	//CodeField:        `COMMON_MSG_00007`,
	CodeField:   `禁用失败`,
	exposeDebug: false,
	cause:       nil,
	log: log{
		Action: assembler.LogActionUpdate,
		Module: assembler.LogModuleMenu,
		Record: `禁用菜单:%s`,
	},
	lang: nil,
}

var EnableMenu *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errMenuResponseNotName,
	DescriptionField: `启用失败`,
	//CodeField:        `COMMON_MSG_00007`,
	CodeField:   `启用失败`,
	exposeDebug: false,
	cause:       nil,
	log: log{
		Action: assembler.LogActionUpdate,
		Module: assembler.LogModuleMenu,
		Record: `启用菜单:%s`,
	},
	lang: nil,
}

var DelMenu *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errMenuResponseNotName,
	DescriptionField: `删除失败`,
	//CodeField:        `COMMON_MSG_00007`,
	CodeField:   `删除失败`,
	exposeDebug: false,
	cause:       nil,
	log: log{
		Action: assembler.LogActionDelete,
		Module: assembler.LogModuleMenu,
		Record: `删除菜单:%s`,
	},
	lang: nil,
}
var MenuHasRole *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errMenuResponseNotName,
	DescriptionField: `存在关联角色，禁止操作`,
	CodeField:        `存在关联角色，禁止操作`,

	exposeDebug: false,
	cause:       nil,
	lang:        nil,
}
