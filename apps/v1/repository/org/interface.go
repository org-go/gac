package org

import (
	"context"
	"payfun.gac.service/apps/v1/dto/common"
	"payfun.gac.service/apps/v1/entity/assembler"
)

type (

	iOrgRepository interface {

		//  Create
		Create(ctx context.Context, opt assembler.AdminOrgAssembler) (org assembler.AdminOrgAssembler, err error)
		//  Update
		Update(ctx context.Context, opt assembler.AdminOrgAssembler) (err error)
		//  Status
		Status(ctx context.Context, pk int32, status int) (err error)
		//  Orgs
		Orgs(ctx context.Context, opt assembler.AdminOrgAssembler, param common.PaginationParam) (orgs assembler.AdminOrgAssemblers, page *common.PaginationResult,  err error)

	}

)
