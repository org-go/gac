package errx

import (
	"net/http"
	"payfun.gac.service/apps/v1/entity/assembler"
)

const (
	errPermissionResponseNotName = "permission"
)

var Bind *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errPermissionResponseNotName,
	DescriptionField: `绑定失败`,
	//CodeField:        `COMMON_MSG_00002`,
	CodeField:   `绑定失败`,
	exposeDebug: false,
	cause:       nil,
	log: log{
		Action: assembler.LogActionInsert,
		Module: assembler.LogModulePermission,
		Record: `权限绑定:%s`,
	},
	lang: nil,
}

var Query *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errPermissionResponseNotName,
	DescriptionField: `查询失败`,
	//CodeField:        `COMMON_TXT_00101`,
	CodeField:   `查询失败`,
	exposeDebug: false,
	cause:       nil,
}
