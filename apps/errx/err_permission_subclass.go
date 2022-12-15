package errx

import (
	"net/http"
	"payfun.gac.service/apps/v1/entity/assembler"
)

const (
	errPermissionSubclassResponseNotName = "permission_subclass"
)

var BindSubclass *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errPermissionSubclassResponseNotName,
	DescriptionField: `绑定失败`,
	CodeField:        `COMMON_MSG_00004`,
	//CodeField:   `绑定失败`,
	exposeDebug: false,
	cause:       nil,
	log: log{
		Action: assembler.LogActionInsert,
		Module: assembler.LogModulePermission,
		Record: `服务商子权限绑定:%s`,
	},
	lang: nil,
}

var QuerySubclass *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errPermissionSubclassResponseNotName,
	DescriptionField: `查询失败`,
	CodeField:        `COMMON_TXT_00101`,
	//CodeField:   `查询失败`,
	exposeDebug: false,
	cause:       nil,
}
