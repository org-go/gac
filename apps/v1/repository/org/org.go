package org

import (
	"context"
	"payfun.gac.service/apps/v1/dto/common"
	"payfun.gac.service/apps/v1/entity/assembler"
	"payfun.gac.service/apps/v1/entity/model"
	"payfun.gac.service/apps/v1/repository/repo"
)

type orgRepo struct {}


/**
 * $(Create)
 * @Description:
 * @receiver this
 * @param ctx
 * @param opt
 * @return org
 * @return err
 */
func (this orgRepo) Create(ctx context.Context, opt assembler.AdminOrgAssembler) (org assembler.AdminOrgAssembler, err error) {

	db := repo.GetDBWithTable(ctx, &model.AdminOrg{})
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
func (this orgRepo) Update(ctx context.Context, opt assembler.AdminOrgAssembler) (err error) {

	db := repo.GetDBWithTable(ctx, &model.AdminOrg{}).Where(`pk = ?`, opt.Pk)

	err = db.Updates(&opt).Error
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
func (this orgRepo) Status(ctx context.Context, pk int32, status int) (err error) {

	db := repo.GetDBWithTable(ctx, &model.AdminOrg{})
	err = db.Where(`pk = ? AND status != ?`, pk, 3).Update(`status`, status).Error
	return err

}

/**
 * $(Orgs)
 * @Description:
 * @receiver this
 * @param ctx
 * @param opt
 * @return orgs
 * @return err
 */
func (this orgRepo) Orgs(ctx context.Context, opt assembler.AdminOrgAssembler, param common.PaginationParam) (orgs assembler.AdminOrgAssemblers, page *common.PaginationResult,  err error) {

	db := repo.GetDBWithTable(ctx, &model.AdminOrg{}).Where(`status != ?`, 3)
	if v := opt.Pk; v != 0 {
		db = db.Where(`pk = ?`, v)
	}
	if v := opt.Type; v != `` {
		db = db.Where(`type = ?`, v)
	}
	if v := opt.Status; v != 0 {
		db = db.Where(`status = ?`, v)
	}

	page, err = repo.WrapPageQuery(db, param, &orgs)

	return orgs, page, err

}

