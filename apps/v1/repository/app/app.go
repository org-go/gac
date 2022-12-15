package app

import (
	"context"
	"payfun.gac.service/apps/v1/dto/common"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/entity/assembler"
	"payfun.gac.service/apps/v1/entity/model"
	"payfun.gac.service/apps/v1/repository/repo"
)

type appRepo struct{}

/**
 * $(todo)
 * @Description:
 * @receiver this
 * @param ctx
 * @param opt
 * @return appx
 * @return err
 */
func (this appRepo) App(ctx context.Context, opt assembler.AdminAppAssembler) (appx assembler.AdminAppAssembler, err error) {

	db := repo.GetDBWithTable(ctx, &model.AdminApp{}).Where(`status!= ?`, 3)
	if v := opt.Code; v != `` {
		db = db.Where(`code = ?`, v)
	}
	if v := opt.Type; v != 0 {
		db = db.Where(`type = ?`, v)
	}
	if v := opt.Pk; v != 0 {
		db = db.Where(`pk = ?`, v)
	}
	err = db.Find(&appx).Error

	return appx, err

}

/**
 * $(Create)
 * @Description:
 * @receiver this
 * @param ctx
 * @param opt
 * @return org
 * @return err
 */
func (this appRepo) Create(ctx context.Context, opt assembler.AdminAppAssembler) (org assembler.AdminAppAssembler, err error) {

	db := repo.GetDBWithTable(ctx, &model.AdminApp{})
	err = db.Save(&opt).Error
	return opt, err

}

/**
 * $(Update)
 * @Description:
 * @receiver this
 * @param ctx
 * @param opt
 * @return err
 */
func (this appRepo) Update(ctx context.Context, opt assembler.AdminAppAssembler) (err error) {

	db := repo.GetDBWithTable(ctx, &model.AdminApp{})
	err = db.Where(`pk=? AND status != ?`, opt.Pk, 3).Omit(`status`, `code`).Updates(&opt).Error
	return err

}

/**
 * $(Status)
 * @Description:
 * @receiver this
 * @param ctx
 * @param pk
 * @param status
 * @return err
 */
func (this appRepo) Status(ctx context.Context, pk int32, status int) (err error) {
	db := repo.GetDBWithTable(ctx, &model.AdminApp{})
	err = db.Where(`pk = ? AND status <> 3`, pk).Update(`status`, status).Error
	return err
}

/**
 * $(Apps)
 * @Description:
 * @receiver this
 * @param ctx
 * @param opt
 * @param param
 * @return apps
 * @return page
 * @return err
 */
func (this appRepo) Apps(ctx context.Context, opt assembler.AdminAppAssembler, param req.AppSearchReq) (apps assembler.AdminAppAssemblers, page *common.PaginationResult, err error) {


	db := repo.GetDBWithTable(ctx, &model.AdminApp{}).Where(`status != ?`, 3).Order(`pk DESC`)

	if param.Pagination {
		db = db.Where(`pk != 1`)
	}
	if v := opt.Pk; v != 0 {
		db = db.Where(`pk = ?`, v)
	}
	if v := opt.Name; v != `` {
		db = db.Where(`name like ?`, "%"+v+"%")
	}
	if v := opt.Status; v != 0 {
		db = db.Where(`status = ?`, v)
	}
	if v := param.Orgs; len(v) > 0 {
		db = db.Where(`org_pk IN(?)`, v)
	}
	page, err = repo.WrapPageQuery(db, param.PaginationParam, &apps)

	return apps, page, err

}
