package subclass

import (
    "github.com/gin-gonic/gin"
    "payfun.gac.service/apps/meta/contextx"
    "payfun.gac.service/apps/v1/entity/assembler"
    "payfun.gac.service/apps/v1/repository/account"
    "payfun.gac.service/pkg/org.pm.sdk/logx"
)

/**
 * $(checkSubclass)
 * @Description: 校验
 * @receiver this
 * @param c
 * @param subclass
 * @return info
 * @return err
 */
func checkSubclass(c *gin.Context, sub assembler.AccountSubclassAssembler) (info assembler.AccountSubclassAssembler, err error) {
    ctx := c.Request.Context()
    info, err = account.RepoSubclass.Query(c, assembler.AccountSubclassAssembler{
        Id:        sub.Id,
        AccountId: contextx.FromAuthorized(ctx).AccountID,
    })
    if err != nil || info.Pk == 0 {
        logx.C(c).Error(err, func() string {return `subclass.account.find.error`})
        return info, err
    }
    return info, err

}
