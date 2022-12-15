package subclass

import (
	"github.com/gin-gonic/gin"
	"payfun.gac.service/apps/errx"
	"payfun.gac.service/apps/meta/contextx"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/dto/resp"
	"payfun.gac.service/apps/v1/entity/assembler"
	"payfun.gac.service/apps/v1/repository/account"
	"payfun.gac.service/pkg"
	"payfun.gac.service/pkg/org.pm.sdk/logx"
)

/**
 * $(Login)
 * @Description:
 * @receiver this
 * @param c
 * @param opt
 * @return login
 * @return err
 */
func (this subclassService) Login(c *gin.Context, opt req.AccountLogin) (sub assembler.AccountSubclassAssembler, err error) {

	sub, err = account.RepoSubclass.Query(c, assembler.AccountSubclassAssembler{Account: opt.Account})
	if err != nil {
		return sub, errx.AccountNoExisted
	} else if sub.Status == 2 {
		return sub, errx.AccountDisabled
	}
	scrypt, _ := pkg.Scrypt(opt.Password, this.Salt)
	if sub.Password != scrypt {
		return sub, errx.LoginPasswordErr
	}

	go func() {
		account.RepoSubclass.UpdateLoginInfo(c.Request.Context(), sub.Id, c.ClientIP())
	}()

	return sub, err
}

/**
 * $(SelfGetSubclassAccountInfo)
 * @Description: 详情
 * @receiver this
 * @param c
 * @param account
 * @return error
 */
func (this subclassService) SelfGetSubclassAccountInfo(c *gin.Context) (info resp.AccountSubclassResp) {
	ctx := c.Request.Context()
	sub, _ := account.RepoSubclass.Query(c, assembler.AccountSubclassAssembler{
		Account:   contextx.FromAuthorized(ctx).SubAccount,
		AccountId: contextx.FromAuthorized(ctx).AccountID,
	})
	if sub.Pk > 0 {
		info = resp.AccountSubclassResp{
			Id:            sub.Id,
			Name:          sub.Name,
			Account:       sub.Account,
			Status:        sub.Status,
			CreatedTime:   sub.CreatedTime,
			UpdatedTime:   sub.UpdatedTime,
			CreatedIp:     sub.CreatedIp,
			LastLoginIp:   sub.LastLoginIp,
			LoginCount:    sub.LoginCount,
			LastLoginTime: sub.LastLoginTime,
			CreatedUser:   sub.CreatedUser,
		}

	}
	return info

}

/**
 * $(SelfRestSubclassAccountPassword)
 * @Description: 重置密码
 * @receiver this
 * @param c
 * @param password
 * @return error
 */
func (this subclassService) SelfRestSubclassAccountPassword(c *gin.Context, password req.AuthSubclassResetPasswordReq) error {

	info, err := checkSubclass(c, assembler.AccountSubclassAssembler{})
	if err != nil {
		return err
	}
	scrypt, _ := pkg.Scrypt(password.OldPassword, this.Salt)
	if scrypt != info.Password {
		logx.C(c).Error(errx.SetSubclassPassword.CodeError(), func() string {
			return `subclass.account.password.reset.error`
		})
		return errx.SetSubclassPassword
	}
	info.Password, _ = pkg.Scrypt(password.Password, this.Salt)
	err = account.RepoSubclass.Update(c, info)
	if err != nil {
		logx.C(c).Error(err, func() string { return `subclass.account.password.error` })
		return err
	}

	return err

}

/**
 * $(SelfUpdateSubclassAccount)
 * @Description: 更新
 * @receiver this
 * @param c
 * @param sub
 * @return error
 */
func (this subclassService) SelfUpdateSubclassAccount(c *gin.Context, opt req.AuthSubclassUpdateReq) error {
	ctx := c.Request.Context()
	info, err := checkSubclass(c, assembler.AccountSubclassAssembler{
		Account:   contextx.FromAuthorized(ctx).SubAccount,
		AccountId: contextx.FromAuthorized(ctx).AccountID,
	})
	if err != nil {
		return err
	}
	info.Name = opt.Name
	info.Mobile = opt.Mobile
	err = account.RepoSubclass.Update(c, info)

	return err

}
