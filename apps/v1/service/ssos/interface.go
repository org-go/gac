package ssos

import (
	"github.com/gin-gonic/gin"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/dto/resp"
)

// Loginer 登录接口
type Loginer interface {
	Login(c *gin.Context, accountLogin req.AccountLogin) (*resp.LoginResp, error)
}
