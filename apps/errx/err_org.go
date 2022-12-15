package errx

import (
	"net/http"
	"payfun.gac.service/apps/v1/entity/assembler"
)

const (
	errOrgResponseNotName = "org"
)

//  AddOrg
var AddOrg *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errOrgResponseNotName,
	DescriptionField: ``,
	CodeField:        ``,
	log:              log{
		Action: assembler.LogActionInsert,
		Module: assembler.LogModuleOrg,
		Record: `添加组织:%s`,
	},
	lang:             nil,
}

//  EditOrg
var EditOrg *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errOrgResponseNotName,
	DescriptionField: ``,
	CodeField:        ``,
	log:              log{
		Action: assembler.LogActionUpdate,
		Module: assembler.LogModuleOrg,
		Record: `编辑组织:%s`,
	},
	lang:             nil,
}

//  DeleteOrg
var DeleteOrg *RFC6749Error = &RFC6749Error{
	Code:             http.StatusBadRequest,
	ErrorField:       errOrgResponseNotName,
	DescriptionField: ``,
	CodeField:        ``,
	log:              log{
		Action: assembler.LogActionDelete,
		Module: assembler.LogModuleOrg,
		Record: `删除组织:%s`,
	},
	lang:             nil,
}
