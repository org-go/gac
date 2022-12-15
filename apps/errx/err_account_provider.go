package errx

import (
	"net/http"

	"payfun.gac.service/apps/v1/entity/assembler"
)

const (
	errAccountProvdResponseNotName = "AccountProvd"
)

// AccountProvds 列表查询
var AccountProvds *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errAccountProvdResponseNotName,
	DescriptionField: `查询失败`,
	//CodeField:        `COMMON_TXT_00101`,
	CodeField:   `查询失败`,
	exposeDebug: false,
	cause:       nil,
}

// AccountProvdLogin 登录
var AccountProvdLogin *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errAccountProvdResponseNotName,
	DescriptionField: `登录失败`,
	//CodeField:        `COMMON_TXT_00101`,
	CodeField:   `登录失败`,
	exposeDebug: false,
	cause:       nil,
	log: log{
		Action: assembler.LogActionLogin,
		Module: assembler.LogModuleAccount,
		Record: `账户登录:%s`,
	},
	lang: nil,
}

// AddAccountProvd 增加账户
var AddAccountProvd *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errAccountProvdResponseNotName,
	DescriptionField: `提交失败`,
	//CodeField:        `COMMON_MSG_00002`,
	CodeField:   `提交失败`,
	exposeDebug: false,
	cause:       nil,
	log: log{
		Action: assembler.LogActionInsert,
		Module: assembler.LogModuleAccount,
		Record: `添加角色:%s`,
	},
	lang: nil,
}

// UpdateAccountProvd 更新
var UpdateAccountProvd *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errMenuResponseNotName,
	DescriptionField: `更新失败`,
	//CodeField:        `COMMON_MSG_00007`,
	CodeField:   `更新失败`,
	exposeDebug: false,
	cause:       nil,
	log: log{
		Action: assembler.LogActionUpdate,
		Module: assembler.LogModuleAccount,
		Record: `更新角色:%s`,
	},
	lang: nil,
}

// UpdateAccountProvdPasswd 更新
var UpdateAccountProvdPasswd *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errMenuResponseNotName,
	DescriptionField: `更改密码失败`,
	//CodeField:        `COMMON_MSG_00007`,
	CodeField:   `更改密码失败`,
	exposeDebug: false,
	cause:       nil,
	log: log{
		Action: assembler.LogActionUpdate,
		Module: assembler.LogModuleAccount,
		Record: `更改密码失败:%s`,
	},
	lang: nil,
}

// DisableAccountProvd 禁用
var DisableAccountProvd *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errMenuResponseNotName,
	DescriptionField: `更新失败`,
	//CodeField:        `COMMON_MSG_00007`,
	CodeField:   `禁用失败`,
	exposeDebug: false,
	cause:       nil,
	log: log{
		Action: assembler.LogActionUpdate,
		Module: assembler.LogModuleAccount,
		Record: `禁用角色:%s`,
	},
	lang: nil,
}

// EnableAccountProvd 启用
var EnableAccountProvd *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errMenuResponseNotName,
	DescriptionField: `更新失败`,
	//CodeField:        `COMMON_MSG_00007`,
	CodeField:   `启用失败`,
	exposeDebug: false,
	cause:       nil,
	log: log{
		Action: assembler.LogActionUpdate,
		Module: assembler.LogModuleAccount,
		Record: `启用角色:%s`,
	},
	lang: nil,
}

// DelAccountProvd 删除
var DelAccountProvd *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errMenuResponseNotName,
	DescriptionField: `删除失败`,
	//CodeField:        `COMMON_MSG_00007`,
	CodeField:   `删除失败`,
	exposeDebug: false,
	cause:       nil,
	log: log{
		Action: assembler.LogActionDelete,
		Module: assembler.LogModuleAccount,
		Record: `删除角色:%s`,
	},
	lang: nil,
}
