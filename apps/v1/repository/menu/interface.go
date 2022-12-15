package menu

import (
	"context"
	"payfun.gac.service/apps/v1/dto/common"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/entity/assembler"
	"payfun.gac.service/apps/v1/entity/model"
)

type (
	iMenuRepository interface {
		Menus(ctx context.Context, opt req.MenuReq) (assembler.MenuAssemblers, *common.PaginationResult, error)
		Menu(ctx context.Context, opt req.MenuReq) (assembler.MenuAssembler, error)
		AddMenu(ctx context.Context, o *model.AuthMenu) (*model.AuthMenu, error)
		UpdateMenu(ctx context.Context, o *model.AuthMenu) (*model.AuthMenu, error)
		UpdateMenuStatus(ctx context.Context, opt req.UpdateMenuStatusReq) error
		UpdateParentMenuInfo(ctx context.Context, o *model.AuthMenu) error
		MenusByParentId(ctx context.Context, opt req.MenuReq) (assembler.MenuAssemblers, error)
	}
)
