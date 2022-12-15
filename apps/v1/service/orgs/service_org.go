package orgs

import (
    "context"
    "fmt"
    "payfun.gac.service/apps/errx"
    "payfun.gac.service/apps/v1/dto/common"
    "payfun.gac.service/apps/v1/dto/req"
    "payfun.gac.service/apps/v1/entity/assembler"
    "payfun.gac.service/apps/v1/repository/app"
    "payfun.gac.service/apps/v1/repository/org"
    "payfun.gac.service/apps/v1/service"
    "payfun.gac.service/apps/v1/service/auths"
    "payfun.gac.service/pkg/org.pm.sdk/logx"
)

type orgService struct {
    edge *service.Edge
}



/**
 * $(Add)
 * @Description:
 * @receiver this
 * @param ctx
 * @param opt
 * @return orgx
 * @return err
 */
func (this orgService) Add(ctx context.Context, opt assembler.AdminOrgAssembler) (orgx assembler.AdminOrgAssembler, err error) {

    opt.CreatedUser = auths.Authorized.Account
    opt = opt.OPT()
    this.edge.WithLog(ctx, errx.AddOrg, opt)
    orgx, err = org.RepoOrg.Create(ctx, opt)
    if err != nil {
        logx.G(&ctx).Error(err, func() string {return `gac.org.add.error`})
        return orgx, err
    }

    return orgx, nil

}

/**
 * $(Edit)
 * @Description:
 * @receiver this
 * @param ctx
 * @param opt
 * @return err
 */
func (this orgService) Edit(ctx context.Context, opt assembler.AdminOrgAssembler) (err error) {

    this.edge.WithLog(ctx, errx.EditOrg, opt)

    err = org.RepoOrg.Update(ctx, opt)
    if err != nil {
        logx.G(&ctx).Error(err, func() string {return `gac.org.edit.error`})
        return err
    }
    return nil
}

/**
 * $(Delete)
 * @Description:
 * @receiver this
 * @param ctx
 * @param pk
 * @return err
 */
func (this orgService) Delete(ctx context.Context, pk int32) (err error) {

    this.edge.WithLog(ctx, errx.DeleteOrg, pk)

    err = this.checkApp(ctx, pk)
    if err != nil {
        return err
    }

    err = org.RepoOrg.Status(ctx, pk, 3)
    if err != nil {
        logx.G(&ctx).Error(err, func() string {return `gac.org.delete.error`})
        return err
    }
    return nil
}

/**
 * $(OrgPage)
 * @Description:
 * @receiver this
 * @param ctx
 * @param opt
 * @return orgs
 * @return page
 * @return err
 */
func (this orgService) OrgPage(ctx context.Context, opt req.OrgSearchReq) (orgs assembler.AdminOrgAssemblers, page *common.PaginationResult, err error) {

    orgs, page, err = org.RepoOrg.Orgs(ctx, assembler.AdminOrgAssembler{
        Pk: opt.Pk,
        Name: opt.Name,
        Status: opt.Status,
    }, opt.PaginationParam)

    return orgs, page, err

}


/**
 * $(checkApp)
 * @Description:
 * @receiver this
 * @param ctx
 * @param pk
 * @return error
 */
func (this orgService) checkApp(ctx context.Context, pk int32) error {

    appx, _ := app.RepoApp.App(ctx, assembler.AdminAppAssembler{Pk: pk})

    if appx.Pk > 0 {
        return fmt.Errorf(`组织下存在App信息，禁止操作`)
    }
    return nil

}
