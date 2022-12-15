package logs

import (
	"context"
	"payfun.gac.service/apps/v1/dto/common"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/entity/assembler"
)

type (

	// iLogSvcInterface
	iLogSvcInterface interface {

		//  Add
		Add(ctx context.Context, lx logger) error
		//  LogPage
		LogPage(ctx context.Context, opt req.LogSearchReq) (lx assembler.AdminLogAssemblers, page *common.PaginationResult, err error)
		//  Module
		Module(ctx context.Context) assembler.Action
		//  Action
		Action(ctx context.Context) assembler.Action


	}

)
