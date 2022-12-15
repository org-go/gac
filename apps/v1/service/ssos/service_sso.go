package ssos

import (
	"encoding/json"
	"fmt"

	"github.com/gin-gonic/gin"
	"payfun.gac.service/apps/errx"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/dto/resp"
	"payfun.gac.service/apps/v1/entity/adapter"
	"payfun.gac.service/apps/v1/entity/assembler"
	"payfun.gac.service/apps/v1/repository/account"
	"payfun.gac.service/apps/v1/service"
	"payfun.gac.service/apps/v1/service/accounts"
	"payfun.gac.service/apps/v1/service/auths"
	"payfun.gac.service/apps/v1/service/subclass"

	subProvider "payfun.gac.service/apps/v1/service/subclass"
)

// SsoAccount sso 账户
type SsoAccount struct {
	edge *service.Edge
}

// Login 登录
func (s *SsoAccount) Login(c *gin.Context, accountLogin req.AccountLogin) (*resp.LoginResp, error) {
	switch accountLogin.AccountType {
	case 0x01:
		res, err := accounts.AdminSvc().Login(c, accountLogin)
		if err != nil {
			return nil, err
		}
		return res, nil
	case 0x02:
		res, err := accounts.ProvdSvc().Login(c, accountLogin)
		if err == nil {
			return res, nil
		}

		res, err = s.subProvdLogin(c, accountLogin)
		if err != nil {
			return nil, err
		}
		return res, nil
	case 0x03:
	case 0x04:
	}

	return nil, nil
}

func (s *SsoAccount) subProvdLogin(c *gin.Context, accountLogin req.AccountLogin) (*resp.LoginResp, error) {
	ctx := c.Request.Context()
	subAcct, err := subclass.Svc().Login(c, accountLogin)
	if err != nil {
		return nil, err
	}

	provd, err := account.RepoAcctProvd.Get(c, subAcct.AccountId)
	if err != nil {
		return nil, err
	} else if provd.ProviderId == 0 {
		return nil, errx.AccountNoExisted
	}

	var appCodes []string
	var permissionRoleApp []assembler.PermissionRoleApp

	cmd := s.edge.Redis.HGet(ctx, subProvider.PermissionSubclassRoleAppRedis, fmt.Sprintf("%d", subAcct.SubRolePk))
	vb, _ := cmd.Bytes()
	json.Unmarshal(vb, &permissionRoleApp)

	for _, v := range permissionRoleApp {
		appCodes = append(appCodes, v.Code)
	}

	token := auths.Svc().GenerateToken(c, adapter.AuthAdapter{
		// Orgs: nil,
		Apps: appCodes,
		Tag:  "",
		AccountAdapter: adapter.AccountAdapter{
			AccountID:   subAcct.AccountId,
			Account:     provd.Account,
			Name:        subAcct.Name,
			ProviderId:  int(provd.ProviderId),
			SubAccount:  subAcct.Account,
			Type:        adapter.Subclass,
			AccountType: accountLogin.AccountType,
			RoleId:      subAcct.SubRolePk,
		},
	})

	return &resp.LoginResp{
		Token:       &token,
		AppCodes:    appCodes,
		AccountType: adapter.Subclass,
	}, nil
}
