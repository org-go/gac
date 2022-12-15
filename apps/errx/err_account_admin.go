package errx

import (
	"net/http"

	"payfun.gac.service/apps/v1/entity/assembler"
)

const (
	errAccountAdminResponseNotName = "AccountAdmin"
)

// AccountAdmins 列表查询
var AccountAdmins *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errAccountAdminResponseNotName,
	DescriptionField: `查询失败`,
	//CodeField:        `COMMON_TXT_00101`,
	CodeField:   `查询失败`,
	exposeDebug: false,
	cause:       nil,
}

// AccountAdminLogin 登录
var AccountAdminLogin *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errAccountAdminResponseNotName,
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

// AddAccountAdmin 增加账户
var AddAccountAdmin *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errAccountAdminResponseNotName,
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

// UpdateAccountAdmin 更新
var UpdateAccountAdmin *RFC6749Error = &RFC6749Error{
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
		Record: `更新账号信息:%s`,
	},
	lang: nil,
}

// DisableAccountAdmin 禁用
var DisableAccountAdmin *RFC6749Error = &RFC6749Error{
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

// EnableAccountAdmin 启用
var EnableAccountAdmin *RFC6749Error = &RFC6749Error{
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

// DelAccountAdmin 删除
var DelAccountAdmin *RFC6749Error = &RFC6749Error{
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

// AcctChangePasswd 更改密码
var AcctChangePasswd *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errMenuResponseNotName,
	DescriptionField: `旧密码错误`,
	//CodeField:        `COMMON_MSG_00007`,
	CodeField:   `旧密码错误`,
	exposeDebug: false,
	cause:       nil,
	log: log{
		Action: assembler.LogActionDelete,
		Module: assembler.LogModuleAccount,
		Record: `旧密码错误:%s`,
	},
	lang: nil,
}
