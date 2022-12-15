package apps

import (
    "context"
    "fmt"
    "payfun.gac.service/apps/errx"
    "payfun.gac.service/apps/v1/dto/common"
    "payfun.gac.service/apps/v1/dto/req"
    "payfun.gac.service/apps/v1/entity/assembler"
    "payfun.gac.service/apps/v1/repository/app"
    "payfun.gac.service/apps/v1/service"
    "payfun.gac.service/apps/v1/service/admins"
    "payfun.gac.service/apps/v1/service/auths"
    "payfun.gac.service/pkg/org.pm.sdk/logx"
    "strings"
)

type appService struct {
    edge *service.Edge
}



/**
 * $(Add)
 * @Description:
 * @receiver this
 * @param ctx
 * @param opt
 * @return app
 * @return err
 */
func (this appService) Add(ctx context.Context, opt assembler.AdminAppAssembler) (appx assembler.AdminAppAssembler, err error) {
    opt.CreatedUser = auths.Authorized.Account
    opt.Code = strings.Trim(opt.Code, ` `)
    opt = opt.OPT()
    this.edge.WithLog(ctx, errx.AddApp, opt)
    // check code
    info, _ := app.RepoApp.App(ctx, assembler.AdminAppAssembler{Code: opt.Code, Type: opt.Type})
    if info.Pk > 0 {
        return appx, fmt.Errorf(`[%s] 已存在`, opt.Code)
    }
    // create
    appx, err = app.RepoApp.Create(ctx, opt)
    if err != nil {
        logx.G(&ctx).Error(err, func() string {return `gac.app.add.error`})
        return appx, err
    }
    // select
    appx, err = app.RepoApp.App(ctx, assembler.AdminAppAssembler{Code: opt.Code})
    if err != nil {
        logx.G(&ctx).Error(err, func() string {return `gac.app.code.error`})
        return appx, err
    }
    return appx, nil

}

/**
 * $(Edit)
 * @Description:
 * @receiver this
 * @param ctx
 * @param opt
 * @return err
 */
func (this appService) Edit(ctx context.Context, opt assembler.AdminAppAssembler) (err error) {
    this.edge.WithLog(ctx, errx.EditApp, opt)

    err = app.RepoApp.Update(ctx, opt)
    if err != nil {
        logx.G(&ctx).Error(err, func() string {return `gac.app.edit.error`})
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
func (this appService) Delete(ctx context.Context, pk int32) (err error) {
    this.edge.WithLog(ctx, errx.DeleteApp, pk)

    menus := this.checkMenu(ctx, pk)
    if len(menus) > 0 {
        return fmt.Errorf(`应用下存在[%d]个权限, 禁止删除`, len(menus))
    }

    err = app.RepoApp.Status(ctx, pk, 3)
    if err != nil {
        logx.G(&ctx).Error(err, func() string {return `gac.app.delete.error`})
        return err
    }
    return nil

}


/**
 * $(Enable)
 * @Description:
 * @receiver this
 * @param ctx
 * @param pk
 * @return err
 */
func (this appService) Enable(ctx context.Context, pk int32) (err error) {

    record := fmt.Sprintf(`pk {%d} > {%d}`, pk, 1)
    this.edge.WithLog(ctx, errx.EditApp, record)
    err = app.RepoApp.Status(ctx, pk, 1)
    if err != nil {
        logx.G(&ctx).Error(err, func() string {return `gac.app.status.error`})
        return err
    }
    return nil
}

/**
 * $(Disable)
 * @Description:
 * @receiver this
 * @param ctx
 * @param pk
 * @param status
 * @return err
 */
func (this appService) Disable(ctx context.Context, pk int32) (err error) {
    record := fmt.Sprintf(`pk {%d} > {%d}`, pk, 2)
    this.edge.WithLog(ctx, errx.EditApp, record)
    menus := this.checkMenu(ctx, pk)
    if len(menus) > 0 {
        return fmt.Errorf(`应用下存在[%d]个权限, 不能禁用`, len(menus))
    }
    err = app.RepoApp.Status(ctx, pk, 2)
    if err != nil {
        logx.G(&ctx).Error(err, func() string {return `gac.app.status.error`})
        return err
    }
    return nil
}

/**
 * $(AppPage)
 * @Description:
 * @receiver this
 * @param ctx
 * @param opt
 * @return apps
 * @return page
 * @return err
 */
func (this appService) AppPage(ctx context.Context, opt req.AppSearchReq) (apps assembler.AdminAppAssemblers, page *common.PaginationResult, err error) {

    apps, page, err = app.RepoApp.Apps(ctx, assembler.AdminAppAssembler{
        Pk: opt.Pk,
        Name: opt.Name,
        Status: opt.Status,
    }, opt)

    return apps, page, err

}


/**
 * $(checkMenu)
 * @Description:
 * @receiver this
 * @param ctx
 * @param pk
 * @return assembler.MenuAssemblers
 */
func (this appService) checkMenu(ctx context.Context, pk int32) assembler.MenuAssemblers {

    data, _, _ := admins.Svc().GetMenuPage(ctx, req.MenuReq{AppPk: int(pk), Status: 1})
    return data

}



