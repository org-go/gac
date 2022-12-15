package logs

import (
    "context"
    "payfun.gac.service/apps/v1/dto/common"
    "payfun.gac.service/apps/v1/dto/req"
    "payfun.gac.service/apps/v1/entity/assembler"
    "payfun.gac.service/apps/v1/repository/log"
)

type logService struct {

}


/**
 * $(Module)
 * @Description:
 * @receiver this
 * @param ctx
 * @return assembler.Action
 */
func (this logService) Module(ctx context.Context) assembler.Action {

    return new(assembler.LogModule)

}


/**
 * $(Action)
 * @Description:
 * @receiver this
 * @param ctx
 * @return assembler.Action
 */
func (this logService) Action(ctx context.Context) assembler.Action {

    return new(assembler.LogAction)

}

/**
 * $(Add)
 * @Description:
 * @receiver this
 * @param ctx
 * @param lx
 * @return error
 */
func (this logService) Add(ctx context.Context, lx logger) error {

    def := lx.def(ctx)
    lx(&def)
    err := log.RepoLog.Add(ctx, def)
    return err

}


/**
 * $(LogPage)
 * @Description:
 * @receiver this
 * @param ctx
 * @param opt
 * @return lx
 * @return page
 * @return err
 */
func (this logService) LogPage(ctx context.Context, opt req.LogSearchReq) (lx assembler.AdminLogAssemblers, page *common.PaginationResult, err error) {

    lx, page, err = log.RepoLog.Logs(ctx, opt)
    return lx, page, err

}





