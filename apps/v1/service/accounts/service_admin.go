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

type actAdmin struct {
	Salt string
	edge *service.Edge
}

// Create 创建账户
func (a *actAdmin) Create(c *gin.Context, accadmin req.AccountAdmin) error {
	ctx := c.Request.Context()
	a.edge.WithLog(c, errx.AddAccountAdmin, accadmin)

	acc, err := account.RepoAccountAdmin.GetByAccount(ctx, accadmin.Account)
	if acc.Pk > 0 {
		return errors.New("account has exists")
	}

	accountID := lib.GenerateGlobalID()
	scrpasswd, err := pkg.Scrypt(accadmin.Password, a.Salt)
	if err != nil {
		return err
	}

	return repo.NewTransRepo().Exec(ctx, func(ctx context.Context) error {
		// 员工账户
		err := account.RepoAccountAdmin.Create(ctx, model.AccountAdmin{
			RolePk:      int32(accadmin.RolePK),
			Name:        accadmin.AccountName,
			AccountId:   accountID,
			Account:     accadmin.Account,
			Mobile:      accadmin.Mobile,
			Password:    scrpasswd,
			Secret:      "",
			Status:      1,
			CreatedTime: time.Now(),
			UpdatedTime: time.Now(),
			CreatedId: func() string {
				token := contextx.FromAuthorized(ctx)
				return token.AccountID
			}(),
			CreatedIp:     c.ClientIP(),
			LastLoginIp:   c.ClientIP(),
			LoginCount:    0,
			LastLoginTime: time.Now(),
		})
		if err != nil {
			return err
		}

		// sso账户
		err = account.RepoAccount.Create(ctx, model.SsoAccount{
			Id:          accountID,
			AccountType: "0x01",
			Mobile:      accadmin.Mobile,
		})
		if err != nil {
			return err
		}

		return nil
	})
}

// Query 内部员工账户列表查询
func (a *actAdmin) Query(c *gin.Context, accountParams req.QueryAccountParams) (assembler.AccountAdmins, *common.PaginationResult, error) {
	result, pr, err := account.RepoAccountAdmin.Query(c.Request.Context(), accountParams)
	if err != nil {
		return result, pr, err
	}
	for i := 0; i < len(result); i++ {
		result[i].Password = ""
		result[i].Pk = 0
	}
	return result, pr, nil
}

func (a *actAdmin) Login(c *gin.Context, accountLogin req.AccountLogin) (*resp.LoginResp, error) {
	ctx := c.Request.Context()

	a.edge.WithLog(c, errx.AccountAdminLogin, req.AccountLogin{
		Mobile:      accountLogin.Mobile,
		Account:     accountLogin.Account,
		Password:    "",
		AccountType: accountLogin.AccountType,
	})

	accountAdmin, err := account.RepoAccountAdmin.GetByAccount(c, accountLogin.Account)
	if err != nil {
		return nil, errx.AccountNoExisted
	} else if accountAdmin.Status == 2 {
		return nil, errx.AccountDisabled
	} else if err := a.verify(accountLogin.Password, accountAdmin.Password); err != nil {
		return nil, errx.LoginPasswordErr
	}

	var t adapter.Type
	switch {
	case accountAdmin.IsAdmin == 1:
		t = adapter.Super
	case accountAdmin.IsAdmin == 0:
		t = adapter.Admin
	}

	var permissionRoleApp []assembler.PermissionRoleApp
	cmd := a.edge.Redis.HGet(ctx, admins.PermissionRoleAppRedis, fmt.Sprintf("%d", accountAdmin.RolePk))

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
			AccountID:   accountAdmin.AccountId,
			Account:     accountAdmin.Account,
			Name:        accountAdmin.Name,
			Type:        t,
			AccountType: accountLogin.AccountType,
			RoleId:      accountAdmin.RolePk,
		},
	})

	go func() {
		account.RepoAccountAdmin.Update(c, accountAdmin.AccountId, model.AccountAdmin{
			LoginCount:    accountAdmin.LoginCount + 1,
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

func (a *actAdmin) verify(oriPassword, scrpasswd string) error {
	p, err := pkg.Scrypt(oriPassword, a.Salt)
	if err != nil {
		return errors.New("internal error")
	} else if p != scrpasswd {
		return errors.New("account or passwrod error")
	}

	return nil
}

func (a *actAdmin) Enable(c *gin.Context, aid string) error {
	ctx := c.Request.Context()
	a.edge.WithLog(c, errx.EnableAccountAdmin, aid)

	return account.RepoAccountAdmin.Update(ctx, aid, model.AccountAdmin{
		Status:      byte(1),
		UpdatedTime: time.Now(),
	})
}

func (a *actAdmin) Disable(c *gin.Context, aid string) error {
	ctx := c.Request.Context()
	a.edge.WithLog(c, errx.DisableAccountAdmin, aid)

	return account.RepoAccountAdmin.Update(ctx, aid, model.AccountAdmin{
		Status:      byte(2),
		UpdatedTime: time.Now(),
	})
}

func (a *actAdmin) Delete(c *gin.Context, aid string) error {
	ctx := c.Request.Context()
	a.edge.WithLog(c, errx.DelAccountAdmin, aid)

	return account.RepoAccountAdmin.Update(ctx, aid, model.AccountAdmin{
		Status:      byte(3),
		UpdatedTime: time.Now(),
	})
}

func (a *actAdmin) Update(c *gin.Context, aid string, accadmin req.UpdateAccountAdmin) error {
	ctx := c.Request.Context()
	a.edge.WithLog(c, errx.UpdateAccountAdmin, accadmin)

	acc, err := account.RepoAccountAdmin.Get(ctx, accadmin.AccountID)
	if acc.Pk == 0 {
		return errors.New("account not exists")
	}

	// scrpasswd, err := pkg.Scrypt(accadmin.Password, a.Salt)
	// if err != nil {
	// 	return err
	// }

	// 员工账户
	err = account.RepoAccountAdmin.Update(ctx, aid, model.AccountAdmin{
		RolePk: int32(accadmin.RolePK),
		Name:   accadmin.AccountName,
		// Account:  accadmin.Account,
		Mobile: accadmin.Mobile,
		// Password: scrpasswd,
	})
	if err != nil {
		return err
	}

	return nil
}

func (a *actAdmin) ResetPassword(c *gin.Context, aid string) error {
	ctx := c.Request.Context()
	a.edge.WithLog(c, errx.UpdateAccountAdmin, aid)

	acc, err := account.RepoAccountAdmin.Get(ctx, aid)
	if acc.Pk == 0 {
		return errors.New("account not exists")
	}

	scrpasswd, err := pkg.Scrypt("a123456", a.Salt)
	if err != nil {
		return err
	}

	// 员工账户
	err = account.RepoAccountAdmin.Update(ctx, aid, model.AccountAdmin{
		Password: scrpasswd,
	})
	if err != nil {
		return err
	}

	return nil
}

// Get 查询员工列表详情
func (a *actAdmin) Get(c *gin.Context, aid string) (assembler.AccountAdmin, error) {
	item, err := account.RepoAccountAdmin.Get(c.Request.Context(), aid)
	item.Password = ""
	item.Pk = 0
	if err != nil {
		return item, err
	}

	return item, nil
}

// UpdatePassword 更新密码
func (a *actAdmin) UpdatePassword(c *gin.Context, aid string, acct req.AcctChangePasswd) error {
	ctx := c.Request.Context()
	a.edge.WithLog(c, errx.UpdateAccountProvd, acct)

	acc, err := account.RepoAccountAdmin.Get(ctx, aid)
	if acc.Pk == 0 {
		return errors.New("account not exists")
	} else if err := a.verify(acct.OldPassword, acc.Password); err != nil {
		return errx.LoginPasswordErr
	}

	var scrpasswd string
	if acct.Password != "" {
		scrpasswd, err = pkg.Scrypt(acct.Password, a.Salt)
		if err != nil {
			return err
		}
	}

	// 账户
	err = account.RepoAccountAdmin.Update(ctx, aid, model.AccountAdmin{
		UpdatedTime: time.Now(),
		Password:    scrpasswd,
	})
	if err != nil {
		return err
	}

	return nil
}
