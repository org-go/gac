package errx

import (
	"errors"
	"net/http"

	"payfun.gac.service/apps/v1/entity/assembler"
)

const (
	errJWTKnownName     = "jwt_unknown"
	errLoginPasswd      = "password error"
	errAccountNoExisted = "account has no existed"
	errAccountDisable   = "account is disabled"
)

var JWT *RFC6749Error = &RFC6749Error{
	Code:             http.StatusUnauthorized,
	ErrorField:       errJWTKnownName,
	DescriptionField: `Token认证失败`,
	CodeField:        `COMMON_MSG_00011`,
	exposeDebug:      false,
	cause:            nil,
}

//  Passport
var Passport *RFC6749Error = &RFC6749Error{
	Code:             http.StatusMethodNotAllowed,
	ErrorField:       errJWTKnownName,
	DescriptionField: `未授权的请求`,
	CodeField:        `COMMON_MSG_00019`,
	exposeDebug:      false,
	cause:            nil,
}

// AccountNoExisted 账号不存在
var AccountNoExisted *RFC6749Error = &RFC6749Error{
	Code:             http.StatusOK,
	ErrorField:       errAccountNoExisted,
	DescriptionField: `账号不存在`,
	CodeField:        `COMMON_MSG_00022`,
	exposeDebug:      false,
	cause:            errors.New("COMMON_MSG_00022"),
	log: log{
		Action: assembler.LogActionLogin,
		Module: assembler.LogModuleAccount,
		Record: `账户登录:%s`,
	},
	lang: nil,
}

// LoginPasswordErr password err
var LoginPasswordErr *RFC6749Error = &RFC6749Error{
	Code:             http.StatusOK,
	ErrorField:       errLoginPasswd,
	DescriptionField: `密码错误`,
	CodeField:        `COMMON_MSG_00018`,
	exposeDebug:      false,
	cause:            errors.New("COMMON_MSG_00018"),
	log: log{
		Action: assembler.LogActionLogin,
		Module: assembler.LogModuleAccount,
		Record: `账户登录:%s`,
	},
	lang: nil,
}

// AccountDisabled 账号禁用
var AccountDisabled *RFC6749Error = &RFC6749Error{
	Code:             http.StatusOK,
	ErrorField:       errAccountDisable,
	DescriptionField: `账号已禁用`,
	CodeField:        `COMMON_MSG_00023`,
	exposeDebug:      false,
	cause:            errors.New("COMMON_MSG_00023"),
	log: log{
		Action: assembler.LogActionLogin,
		Module: assembler.LogModuleAccount,
		Record: `账户登录:%s`,
	},
	lang: nil,
}
