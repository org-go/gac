package account

import (
	"context"
	"time"

	"github.com/jinzhu/gorm"
	"payfun.gac.service/apps/v1/dto/common"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/entity/assembler"
	"payfun.gac.service/apps/v1/entity/model"
	"payfun.gac.service/apps/v1/repository/repo"
)

type serviceSubclassRepo struct{}

/**
 * $(Query)
 * @Description:
 * @receiver this
 * @param ctx
 * @param opt
 * @return sub
 * @return err
 */
func (this serviceSubclassRepo) Query(ctx context.Context, opt assembler.AccountSubclassAssembler) (sub assembler.AccountSubclassAssembler, err error) {

	db := repo.GetDBWithTable(ctx, &model.AccountProviderSubclass{})
	if opt.Id != `` {
		db = db.Where(`id = ?`, opt.Id)
	}
	if opt.Account != `` {
		db = db.Where(`account = ?`, opt.Account)
	}
	if opt.AccountId != `` {
		db = db.Where(`account_id = ?`, opt.AccountId)
	}
	if opt.Status != 0 {
		db = db.Where(`status=?`, opt.Status)
	}
	if opt.SubRolePk != 0 {
		db = db.Where(`sub_role_pk = ?`, opt.SubRolePk)
	}

	err = db.Find(&sub).Error

	return sub, err

}

/**
 * $(Create)
 * @Description:
 * @receiver this
 * @param ctx
 * @param sub
 * @return subclass
 * @return err
 */
func (this serviceSubclassRepo) Create(ctx context.Context, sub assembler.AccountSubclassAssembler) (subclass assembler.AccountSubclassAssembler, err error) {

	db := repo.GetDBWithTable(ctx, &model.AccountProviderSubclass{})
	err = db.Create(&sub).Error
	return sub, err

}

/**
 * $(Update)
 * @Description:
 * @receiver this
 * @param ctx
 * @param sub
 * @return err
 */
func (this serviceSubclassRepo) Update(ctx context.Context, sub assembler.AccountSubclassAssembler) (err error) {

	db := repo.GetDBWithTable(ctx, &model.AccountProviderSubclass{})
	err = db.Where(`account_id = ? AND id = ? AND status != 3`, sub.AccountId, sub.Id).Omit(`status`).Update(&sub).Error
	return err

}

/**
 * $(Status)
 * @Description:
 * @receiver this
 * @param ctx
 * @param id
 * @param status
 * @return error
 */
func (this serviceSubclassRepo) Status(ctx context.Context, accountId, id string, status int) error {

	db := repo.GetDBWithTable(ctx, &model.AccountProviderSubclass{})
	return db.Where(`account_id = ? AND id = ? AND status != 3`, accountId, id).Update(`status`, status).Error

}

/**
 * $(Subclass)
 * @Description:
 * @receiver this
 * @param ctx
 * @param opt
 * @return subclass
 * @return page
 * @return err
 */
func (this serviceSubclassRepo) Subclass(ctx context.Context, opt req.AccountSubclassSearchReq) (subclass assembler.AccountSubclassAssemblers, page *common.PaginationResult, err error) {

	db := repo.GetDBWithTable(ctx, &model.AccountProviderSubclass{}).Where(`status != 3 AND account_id = ?`, opt.AccountID).Order(`pk DESC`)
	if v := opt; v.ID != `` {
		db = db.Where(`id = ?`, v)
	}
	if v := opt.Status; v != 0 {
		db = db.Where(`status = ?`, v)
	}
	page, err = repo.WrapPageQuery(db, opt.PaginationParam, &subclass)

	return subclass, page, err

}

// UpdateLoginInfo 更新登录信息
func (this serviceSubclassRepo) UpdateLoginInfo(ctx context.Context, id string, ip string) error {
	db := repo.GetDBWithTable(ctx, &model.AccountProviderSubclass{})

	return db.Where(`id = ?`, id).Updates(map[string]interface{}{
		"login_count":     gorm.Expr("login_count+1"),
		"last_login_time": time.Now(),
		"last_login_ip":   ip,
	}).Error
}
