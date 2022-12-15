package errx

import (
	"net/http"
)

const (
	errMenuSubclassResponseNotName = "menu_subclass"
)

var MenusSubclass *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errMenuSubclassResponseNotName,
	DescriptionField: `查询失败`,
	CodeField:        `COMMON_TXT_00101`,
	//CodeField:   `查询失败`,
	exposeDebug: false,
	cause:       nil,
}
