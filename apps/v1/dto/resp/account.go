package resp

import (
	"golang.org/x/oauth2"
	"payfun.gac.service/apps/v1/entity/adapter"
)

// LoginResp 登录返回
type LoginResp struct {
	Token       *oauth2.Token `json:"token" swaggerignore:"true"` // token
	AppCodes    []string      `json:"app_codes"`                  // 应用code列表
	AccountType adapter.Type  `json:"type"`                       // 超级管理员: A， 管理员：B, 员工：C, 服务商: D， 外部子账户：I
}
