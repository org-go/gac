package subclass

import (
    "github.com/gin-gonic/gin"
    "payfun.gac.service/apps/errx"
    "payfun.gac.service/apps/meta/contextx"
    "payfun.gac.service/apps/v1/dto/common"
    "payfun.gac.service/apps/v1/dto/req"
    "payfun.gac.service/apps/v1/dto/resp"
    "payfun.gac.service/apps/v1/entity/assembler"
    "payfun.gac.service/apps/v1/repository/account"
    "payfun.gac.service/pkg"
    "payfun.gac.service/pkg/org.pm.sdk/lib"
    "payfun.gac.service/pkg/org.pm.sdk/logx"
    "time"
)

/**
 * $(BindSubclassAccountRole)
 * @Description: 绑定角色
 * @receiver this
 * @param c
 * @param id
 * @param subRolePk
 * @return error
 */
func (this subclassService) BindSubclassAccountRole(c *gin.Context, id string, subRolePk int32) error {

    info, err := checkSubclass(c, assembler.AccountSubclassAssembler{Id: id})
    if err != nil {
        return err
    }
    info.SubRolePk = subRolePk
    err = account.RepoSubclass.Update(c, info)
    if err != nil {
        logx.C(c).Error(err, func() string { return `subclass.bind.role.error` })
    }
    return err

}

/**
 * $(CreateSubclassAccount)
 * @Description: 创建
 * @receiver this
 * @param c
 * @param sub
 * @return error
 */
func (this subclassService) CreateSubclassAccount(c *gin.Context, sub assembler.AccountSubclassAssembler) error {
    ctx := c.Request.Context()
    subclass, _ := account.RepoSubclass.Query(c, assembler.AccountSubclassAssembler{Account: sub.Account})
    if subclass.Pk > 0 {
        return errx.Subclass
    }
    sub.Status = 1
    sub.Id = lib.SnowFlake.Sid()
    sub.CreatedTime = time.Now()
    sub.CreatedIp = c.ClientIP()
    sub.Password, _ = pkg.Scrypt(sub.Password, this.Salt)
    sub.AccountId = contextx.FromAuthorized(ctx).AccountID
    sub.CreatedUser = contextx.FromAuthorized(ctx).Account
    subAccount := contextx.FromAuthorized(ctx).SubAccount
    if subAccount != `` {
        sub.CreatedUser = subAccount
    }

    _, err := account.RepoSubclass.Create(c, sub)
    if err != nil {
        logx.C(c).Error(err, func() string { return `subclass.create.error` })
        return errx.AddSubclass
    }
    return err
}

/**
 * $(EnableSubclassAccount)
 * @Description: 启用
 * @receiver this
 * @param c
 * @param id
 * @return error
 */
func (this subclassService) EnableSubclassAccount(c *gin.Context, id string) error {
    ctx := c.Request.Context()
    _, err := checkSubclass(c, assembler.AccountSubclassAssembler{Id: id})
    if err != nil {
        return err
    }
    err = account.RepoSubclass.Status(c, contextx.FromAuthorized(ctx).AccountID, id, 1)
    return err

}

/**
 * $(DisableSubclassAccount)
 * @Description:    禁用
 * @receiver this
 * @param c
 * @param id
 * @return error
 */
func (this subclassService) DisableSubclassAccount(c *gin.Context, id string) error {

    ctx := c.Request.Context()
    _, err := checkSubclass(c, assembler.AccountSubclassAssembler{Id: id})
    if err != nil {
        return err
    }
    err = account.RepoSubclass.Status(c, contextx.FromAuthorized(ctx).AccountID, id, 2)
    return err

}

/**
 * $(DeleteSubclassAccount)
 * @Description:    删除
 * @receiver this
 * @param c
 * @param id
 * @return error
 */
func (this subclassService) DeleteSubclassAccount(c *gin.Context, id string) error {
    ctx := c.Request.Context()
    _, err := checkSubclass(c, assembler.AccountSubclassAssembler{Id: id})
    if err != nil {
        return err
    }
    err = account.RepoSubclass.Status(c, contextx.FromAuthorized(ctx).AccountID, id, 3)
    return err

}

/**
 * $(GetSubclassAccountPage)
 * @Description: 分页
 * @receiver this
 * @param c
 * @param opt
 * @return subs
 * @return page
 * @return err
 */
func (this subclassService) GetSubclassAccountPage(c *gin.Context, opt req.AccountSubclassSearchReq) (subs resp.AccountSubclassResps, page *common.PaginationResult, err error) {

    ctx := c.Request.Context()
    opt.AccountID = contextx.FromAuthorized(ctx).AccountID
    subx, page, err := account.RepoSubclass.Subclass(c.Request.Context(), opt)
    return this.append(subx), page, err

}

/**
 * $(append)
 * @Description:
 * @receiver this
 * @param subx
 * @return subs
 */
func (this subclassService) append(subx assembler.AccountSubclassAssemblers) (subs resp.AccountSubclassResps) {
    if len(subx) == 0 {
        return subs
    }
    for _, sub := range subx {
        subs = append(subs, resp.AccountSubclassResp{
            SubRolePk:     sub.SubRolePk,
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
        })
    }
    return subs
}
