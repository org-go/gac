package errx

import (
	"net/http"
	"payfun.gac.service/apps/v1/entity/assembler"
)

const (
	errAppResponseNotName = "app"
)

//  AddApp
var AddApp *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errAppResponseNotName,
	DescriptionField: ``,
	CodeField:        ``,
	log:              log{
		Action: assembler.LogActionInsert,
		Module: assembler.LogModuleApp,
		Record: `添加应用:%s`,
	},
	lang:             nil,
}

//  EditApp
var EditApp *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errAppResponseNotName,
	DescriptionField: `更新失败`,
	CodeField:        `COMMON_MSG_00007`,
	log:              log{
		Action: assembler.LogActionUpdate,
		Module: assembler.LogModuleApp,
		Record: `编辑应用:%s`,
	},
	lang:             nil,
}

//  DeleteApp
var DeleteApp *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errOrgResponseNotName,
	DescriptionField: `提交失败`,
	CodeField:        `COMMON_MSG_00002`,
	log:              log{
		Action: assembler.LogActionDelete,
		Module: assembler.LogModuleApp,
		Record: `删除应用:%s`,
	},
	lang:             nil,
}
