package accounts

import (
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"time"

	"github.com/gin-gonic/gin"
	"payfun.gac.service/apps/errx"
	"payfun.gac.service/apps/meta/contextx"
	"payfun.gac.service/apps/v1/dto/common"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/dto/resp"
	"payfun.gac.service/apps/v1/entity/adapter"
	"payfun.gac.service/apps/v1/entity/assembler"
	"payfun.gac.service/apps/v1/entity/model"
	"payfun.gac.service/apps/v1/repository/account"
	"payfun.gac.service/apps/v1/repository/repo"
	"payfun.gac.service/apps/v1/service"
	"payfun.gac.service/apps/v1/service/admins"
	"payfun.gac.service/apps/v1/service/auths"
	"payfun.gac.service/pkg"
	"payfun.gac.service/pkg/org.pm.sdk/lib"
)

type acctProvd struct {
	Salt string
	edge *service.Edge
}

// Create 创建账户
func (a *acctProvd) Create(c *gin.Context, accaprovd req.AccountProvider) error {
	ctx := c.Request.Context()
	a.edge.WithLog(c, errx.AddAccountAdmin, accaprovd)

	_, pr, err := account.RepoAcctProvd.Query(c, req.QueryProvdAccountParams{
		QueryAccountParams: req.QueryAccountParams{
			PaginationParam: common.PaginationParam{
				OnlyCount: true,
			},
		},
		ProvdID: accaprovd.ProvdID,
	})
	if pr.Total > 0 {
		return errors.New("account has exists or have binded provide")
	}

	accountID := lib.GenerateGlobalID()
	scrpasswd, err := pkg.Scrypt(accaprovd.Password, a.Salt)
	if err != nil {
		return err
	}

	customer, err := account.RepoAcctProvdProfile.GetByProvdID(ctx, accaprovd.ProvdID)
	if err != nil {
		return err
	}

	return repo.NewTransRepo().Exec(ctx, func(ctx context.Context) error {
		err := account.RepoAcctProvd.Create(ctx, model.AccountProvider{
			RolePk:     int32(accaprovd.RolePK),
			ProviderId: int32(accaprovd.ProvdID),
			CreatedUser: func() string {
				token := contextx.FromAuthorized(ctx)
				return token.Name
			}(),
			Name:          accaprovd.AccountName,
			AccountId:     accountID,
			Account:       accaprovd.Account,
			Password:      scrpasswd,
			Secret:        "",
			Status:        1,
			CreatedTime:   time.Now(),
			UpdatedTime:   time.Now(),
			CreatedIp:     c.ClientIP(),
			LastLoginIp:   c.ClientIP(),
			LastLoginTime: time.Now(),
		})
		if err != nil {
			return err
		}

		account.RepoAcctProvdProfile.Create(ctx, model.AccountProviderProfile{
			Id:            int64(accaprovd.ProvdID),
			AccountId:     accountID,
			Name:          customer.Name,
			ShortName:     customer.ShortName,
			RegCode:       customer.RegCode,
			Type:          customer.Type,
			Contact:       customer.Contact,
			Phone:         customer.Phone,
			AddressDetail: customer.AddressDetail,
			Email:         customer.Email,
			CreatedTime:   time.Now(),
			UpdatedTime:   time.Now(),
		})

		// sso账户
		err = account.RepoAccount.Create(ctx, model.SsoAccount{
			Id:          accountID,
			AccountType: "0x02",
			Mobile:      accaprovd.Mobile,
		})
		if err != nil {
			return err
		}

		return nil
	})
}

// Query 列表查询
func (a *acctProvd) Query(c *gin.Context, accountParams req.QueryProvdAccountParams) (assembler.AccountProviders, *common.PaginationResult, error) {
	result, pr, err := account.RepoAcctProvd.Query(c.Request.Context(), accountParams)
	if err != nil {
		return result, pr, err
	}
	for i := 0; i < len(result); i++ {
		result[i].Password = ""
		result[i].Pk = 0
	}
	return result, pr, nil
}

func (a *acctProvd) Login(c *gin.Context, accountLogin req.AccountLogin) (*resp.LoginResp, error) {
	ctx := c.Request.Context()

	a.edge.WithLog(c, errx.AccountProvdLogin, req.AccountLogin{
		Mobile:      accountLogin.Mobile,
		Account:     accountLogin.Account,
		Password:    "",
		AccountType: accountLogin.AccountType,
	})

	acctProvd, err := account.RepoAcctProvd.GetByAccount(c, accountLogin.Account, 1)
	if err != nil {
		return nil, errx.AccountNoExisted
	} else if acctProvd.Status == 2 {
		return nil, errx.AccountDisabled
	} else if err := a.verify(accountLogin.Password, acctProvd.Password); err != nil {
		return nil, errx.LoginPasswordErr
	}

	var t adapter.Type = adapter.Org
	var permissionRoleApp []assembler.PermissionRoleApp
	cmd := a.edge.Redis.HGet(ctx, admins.PermissionRoleAppRedis, fmt.Sprintf("%d", acctProvd.RolePk))

	vb, _ := cmd.Bytes()
	json.Unmarshal(vb, &permissionRoleApp)

	var appCodes []string
	for _, v := range permissionRoleApp {
		appCodes = append(appCodes, v.Code)
	}

	token := auths.Svc().GenerateToken(c, adapter.AuthAdapter{
		// Orgs: nil,
		Apps: appCodes,
		Tag:  "",
		AccountAdapter: adapter.AccountAdapter{
			AccountID:   acctProvd.AccountId,
			Account:     acctProvd.Account,
			Name:        acctProvd.Name,
			Type:        t,
			AccountType: accountLogin.AccountType,
			RoleId:      acctProvd.RolePk,
			ProviderId:  int(acctProvd.ProviderId),
		},
	})

	go func() {
		account.RepoAcctProvd.Update(c, acctProvd.AccountId, model.AccountProvider{
			LoginCount:    acctProvd.LoginCount + 1,
			LastLoginIp:   c.ClientIP(),
			LastLoginTime: time.Now(),
		})
	}()

	return &resp.LoginResp{
		Token:       &token,
		AppCodes:    appCodes,
		AccountType: t,
	}, nil
}

func (a *acctProvd) verify(oriPassword, scrpasswd string) error {
	p, err := pkg.Scrypt(oriPassword, a.Salt)
	if err != nil {
		return errors.New("internal error")
	} else if p != scrpasswd {
		return errors.New("account or passwrod error")
	}

	return nil
}

func (a *acctProvd) Enable(c *gin.Context, aid string) error {
	ctx := c.Request.Context()
	a.edge.WithLog(c, errx.EnableAccountProvd, aid)

	return account.RepoAcctProvd.Update(ctx, aid, model.AccountProvider{
		Status:      byte(1),
		UpdatedTime: time.Now(),
	})
}

func (a *acctProvd) Disable(c *gin.Context, aid string) error {
	ctx := c.Request.Context()
	a.edge.WithLog(c, errx.DisableAccountProvd, aid)

	return account.RepoAcctProvd.Update(ctx, aid, model.AccountProvider{
		Status:      byte(2),
		UpdatedTime: time.Now(),
	})
}

func (a *acctProvd) Delete(c *gin.Context, aid string) error {
	ctx := c.Request.Context()
	a.edge.WithLog(c, errx.DelAccountProvd, aid)

	return account.RepoAcctProvd.Update(ctx, aid, model.AccountProvider{
		Status:      byte(3),
		UpdatedTime: time.Now(),
	})
}

func (a *acctProvd) Update(c *gin.Context, aid string, accProvd req.AccountProvider) error {
	ctx := c.Request.Context()
	a.edge.WithLog(c, errx.UpdateAccountProvd, accProvd)

	acc, err := account.RepoAcctProvd.Get(ctx, accProvd.AccountID)
	if acc.Pk == 0 {
		return errors.New("account not exists")
	}

	var scrpasswd string
	if accProvd.Password != "" {
		scrpasswd, err = pkg.Scrypt(accProvd.Password, a.Salt)
		if err != nil {
			return err
		}
	}

	// 员工账户
	err = account.RepoAcctProvd.Update(ctx, aid, model.AccountProvider{
		RolePk: int32(accProvd.RolePK),
		Name:   accProvd.AccountName,
		// Account:  accProvd.Account,
		Password: scrpasswd,
	})
	if err != nil {
		return err
	}

	return nil
}

func (a *acctProvd) QueryAiotCustomer(c *gin.Context, params req.QueryAiotCustomerParams) (assembler.DcAiotCustomers, error) {
	return account.RepoAcctProvd.QueryAiotCustomer(c, params)
}

func (a *acctProvd) Get(c *gin.Context, aid string) (assembler.AccountProvider, error) {
	item, err := account.RepoAcctProvd.Get(c.Request.Context(), aid)
	item.Password = ""
	item.Pk = 0
	if err != nil {
		return item, err
	}

	return item, nil
}

func (a *acctProvd) ResetPassword(c *gin.Context, aid string) error {
	ctx := c.Request.Context()
	a.edge.WithLog(c, errx.UpdateAccountProvd, aid)

	acc, err := account.RepoAcctProvd.Get(ctx, aid)
	if acc.Pk == 0 {
		return errors.New("account not exists")
	}

	scrpasswd, err := pkg.Scrypt("a123456", a.Salt)
	if err != nil {
		return err
	}

	// 员工账户
	err = account.RepoAcctProvd.Update(ctx, aid, model.AccountProvider{
		Password: scrpasswd,
	})
	if err != nil {
		return err
	}

	return nil
}

// UpdatePassword 更新密码
func (a *acctProvd) UpdatePassword(c *gin.Context, aid string, accProvd req.AcctChangePasswd) error {
	ctx := c.Request.Context()
	a.edge.WithLog(c, errx.UpdateAccountProvd, accProvd)

	acc, err := account.RepoAcctProvd.Get(ctx, aid)
	if acc.Pk == 0 {
		return errors.New("account not exists")
	}

	var scrpasswd string
	if accProvd.Password != "" {
		scrpasswd, err = pkg.Scrypt(accProvd.Password, a.Salt)
		if err != nil {
			return err
		}
	}

	// 员工账户
	err = account.RepoAcctProvd.Update(ctx, aid, model.AccountProvider{
		Password: scrpasswd,
	})
	if err != nil {
		return err
	}

	return nil
}
