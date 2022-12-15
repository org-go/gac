package orgs

import (
	"context"
	"payfun.gac.service/apps/v1/dto/common"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/entity/assembler"
)

type (

	// iOrgSvcInterface
	iOrgSvcInterface interface {
		//  Add
		Add(ctx context.Context, opt assembler.AdminOrgAssembler) (orgx assembler.AdminOrgAssembler, err error)
		//  Edit
		Edit(ctx context.Context, opt assembler.AdminOrgAssembler) (err error)
		//  Delete
		Delete(ctx context.Context, pk int32) (err error)
		//  OrgPage
		OrgPage(ctx context.Context, opt req.OrgSearchReq) (orgs assembler.AdminOrgAssemblers, page *common.PaginationResult, err error)

	}

)
