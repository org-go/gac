package log

import (
    "context"
    "payfun.gac.service/apps/v1/dto/common"
    "payfun.gac.service/apps/v1/dto/req"
    "payfun.gac.service/apps/v1/entity/assembler"
    "payfun.gac.service/apps/v1/entity/model"
    "payfun.gac.service/apps/v1/repository/repo"
)

type logRepo struct {}




/**
 * $(Add)
 * @Description:
 * @receiver this
 * @param ctx
 * @param lx
 * @return error
 */
func (this logRepo) Add(ctx context.Context, lx assembler.AdminLogAssembler) error {
    db := repo.GetDBWithTable(ctx, &model.LogSystem{})
    err := db.Save(&lx).Error
    return err

}

/**
 * $(Logs)
 * @Description:
 * @receiver this
 * @param ctx
 * @param opt
 * @return logs
 * @return page
 * @return err
 */
func (this logRepo) Logs(ctx context.Context, opt req.LogSearchReq) (logs assembler.AdminLogAssemblers, page *common.PaginationResult,err error) {

    db := repo.GetDBWithTable(ctx, &model.LogSystem{}).Order(`pk DESC`)
    if v := opt.Module; v != `` {
        db = db.Where(`module = ?`, v)
    }
    if v := opt.Action; v != `` {
        db = db.Where(`action = ?`, v)
    }
    if v := opt.ActionUser; v != `` {
        db = db.Where(`action_user like ?`, "%s"+v+"%s")
    }
    if v := opt.OrgPk; v > 0 {
        db = db.Where(`org_pk = ?`, v)
    }
    if v := opt.AppPk; v > 0 {
        db = db.Where(`app_pk = ?`, v)
    }
    page, err = repo.WrapPageQuery(db, opt.PaginationParam, &logs)

    return logs, page, err

}

