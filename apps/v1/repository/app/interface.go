package app

import (
	"context"
	"payfun.gac.service/apps/v1/dto/common"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/entity/assembler"
)

type (

	iAppRepository interface {

		//  Create
		Create(ctx context.Context, opt assembler.AdminAppAssembler) (appx assembler.AdminAppAssembler, err error)
		//  Update
		Update(ctx context.Context, opt assembler.AdminAppAssembler) (err error)
		//  Status
		Status(ctx context.Context, pk int32, status int) (err error)
		//  Apps
		Apps(ctx context.Context, opt assembler.AdminAppAssembler, param req.AppSearchReq) (apps assembler.AdminAppAssemblers, page *common.PaginationResult, err error)
		//  App
		App(ctx context.Context, opt assembler.AdminAppAssembler) (appx assembler.AdminAppAssembler, err error)


	}

)
