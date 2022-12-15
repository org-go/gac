package errx

import "net/http"

const (
	errThirdLoginName = "third_login"
)

var ThirdLogin *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errThirdLoginName,
	DescriptionField: `三方登录失败`,
	CodeField:        `THIRD_LOGIN_00011`,
	exposeDebug:      false,
	cause:            nil,
}
