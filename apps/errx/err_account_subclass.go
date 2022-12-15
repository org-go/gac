package errx

import (
	"net/http"
	"payfun.gac.service/apps/v1/entity/assembler"
)

const (
	errAccountSubclassResponseNotName = "subclass"
)

//  AddSubclass
var AddSubclass *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errAccountSubclassResponseNotName,
	DescriptionField: `创建失败`,
	CodeField:        `COMMON_MSG_00004`,
	log:              log{
		Action: assembler.LogActionInsert,
		Module: assembler.LogModuleAccountSubclass,
		Record: `添加子账户:%s`,
	},
	lang:             nil,
}


var EditSubclass *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errAccountSubclassResponseNotName,
	DescriptionField: `更新失败`,
	CodeField:        `COMMON_MSG_00007`,
	log:              log{
		Action: assembler.LogActionInsert,
		Module: assembler.LogModuleAccountSubclass,
		Record: `编辑子账户:%s`,
	},
	lang:             nil,
}

var DeleteSubclass *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errAccountSubclassResponseNotName,
	DescriptionField: `提交失败`,
	CodeField:        `COMMON_MSG_00002`,
	log:              log{
		Action: assembler.LogActionInsert,
		Module: assembler.LogModuleAccountSubclass,
		Record: `删除子账户:%s`,
	},
	lang:             nil,
}


//  AddSubclass
var SetSubclassPassword *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errAccountSubclassResponseNotName,
	DescriptionField: `密码错误`,
	CodeField:        `COMMON_MSG_00018`,
	log:              log{
		Action: assembler.LogActionInsert,
		Module: assembler.LogModuleAccountSubclass,
		Record: `重置子账户密码:%s`,
	},
	lang:             nil,
}


//  Subclass
var Subclass *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errAccountSubclassResponseNotName,
	DescriptionField: `账户已存在`,
	CodeField:        `COMMON_MSG_00017`,
	log:              log{
		Action: assembler.LogActionInsert,
		Module: assembler.LogModuleAccountSubclass,
		Record: `重置子账户密码:%s`,
	},
	lang:             nil,
}
