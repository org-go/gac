package apps

import (
	"context"
	"payfun.gac.service/apps/v1/dto/common"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/entity/assembler"
)

type (

	// iAppSvcInterface
	iAppSvcInterface interface {
		//  Add
		Add(ctx context.Context, opt assembler.AdminAppAssembler) (appx assembler.AdminAppAssembler, err error)
		//  Edit
		Edit(ctx context.Context, opt assembler.AdminAppAssembler) (err error)
		//  Delete
		Delete(ctx context.Context, pk int32) (err error)
		//  Disable
		Enable(ctx context.Context, pk int32) (err error)
		//  Disable
		Disable(ctx context.Context, pk int32) (err error)
		//  AppPage
		AppPage(ctx context.Context, opt req.AppSearchReq) (apps assembler.AdminAppAssemblers, page *common.PaginationResult, err error)


	}

)
