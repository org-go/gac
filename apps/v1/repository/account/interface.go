package account

import (
	"context"

	"payfun.gac.service/apps/v1/dto/common"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/entity/assembler"
	"payfun.gac.service/apps/v1/entity/model"
)

type (
	iAccoutAdminRepostory interface {
		// Create 员工账号创建
		Create(context.Context, model.AccountAdmin) error
		// Query 查询员工账号列表
		Query(ctx context.Context, actadminParams req.QueryAccountParams) (assembler.AccountAdmins, *common.PaginationResult, error)
		// Get 查询员工列表详情
		Get(ctx context.Context, aid string) (assembler.AccountAdmin, error)
		// Update 更新员工账户数据
		Update(ctx context.Context, aid string, actadmin model.AccountAdmin) error
		// GetByAccount
		GetByAccount(ctx context.Context, account string) (assembler.AccountAdmin, error)
	}
)
type (
	iAccoutProvdRepostory interface {
		// Create 账号创建
		Create(ctx context.Context, acctprovider model.AccountProvider) error
		// Query 查询
		Query(ctx context.Context, accountParams req.QueryProvdAccountParams) (assembler.AccountProviders, *common.PaginationResult, error)
		// Update 更新
		Update(ctx context.Context, aid string, acctProvider model.AccountProvider) error
		// Get 查询单条
		Get(ctx context.Context, aid string) (assembler.AccountProvider, error)
		// GetByAccount 通过账号查询
		GetByAccount(ctx context.Context, account string, status int) (assembler.AccountProvider, error)
		// QueryAiotCustomer 服务商信息
		QueryAiotCustomer(ctx context.Context, accountParams req.QueryAiotCustomerParams) (assembler.DcAiotCustomers, error)
	}

	iAccoutProvdProfile interface {
		Create(ctx context.Context, acctProvdPf model.AccountProviderProfile) error
		GetByAcctID(ctx context.Context, aid string) (model.AccountProviderProfile, error)
		GetByProvdID(ctx context.Context, pid int) (model.AccountProviderProfile, error)
	}
)

type (
	iAccountRepostory interface {
		// Create sso account
		Create(context.Context, model.SsoAccount) error
	}

	//  iAccountSubclassRepository  subclass
	iAccountSubclassRepository interface {

		//  Create
		Create(ctx context.Context, sub assembler.AccountSubclassAssembler) (subclass assembler.AccountSubclassAssembler, err error)
		//  Update
		Update(ctx context.Context, sub assembler.AccountSubclassAssembler) (err error)
		//  Status
		Status(ctx context.Context, accountId, id string, status int) error
		//  Query
		Query(ctx context.Context, opt assembler.AccountSubclassAssembler) (sub assembler.AccountSubclassAssembler, err error)
		//  Subclass
		Subclass(ctx context.Context, opt req.AccountSubclassSearchReq) (subclass assembler.AccountSubclassAssemblers, result *common.PaginationResult, err error)
		// UpdateLoginInfo 更新登录信息
		UpdateLoginInfo(ctx context.Context, id string, ip string) error
	}
)
