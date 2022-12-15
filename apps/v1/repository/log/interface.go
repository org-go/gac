package log

import (
	"context"
	"payfun.gac.service/apps/v1/dto/common"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/entity/assembler"
)

type (

	iLogRepository interface {

		//  Add
		Add(ctx context.Context, lx assembler.AdminLogAssembler) error
		//  Logs
		Logs(ctx context.Context, opt req.LogSearchReq) (logs assembler.AdminLogAssemblers, page *common.PaginationResult,err error)
	}

)
