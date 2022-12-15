package account

import (
	"context"

	"payfun.gac.service/apps/v1/dto/common"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/entity/assembler"
	"payfun.gac.service/apps/v1/entity/model"
	"payfun.gac.service/apps/v1/repository/repo"
)

type providerRepo struct {
}

// Create 创建服务商账号
func (p *providerRepo) Create(ctx context.Context, acctprovider model.AccountProvider) error {
	db := repo.GetDBWithTable(ctx, &model.AccountProvider{})
	err := db.Create(acctprovider).Error
	if err != nil {
		return err
	}

	return nil
}

// Query 查询服务商账号
func (p *providerRepo) Query(ctx context.Context, accountParams req.QueryProvdAccountParams) (assembler.AccountProviders, *common.PaginationResult, error) {
	db := repo.GetDBWithTable(ctx, &model.AccountProvider{})

	if v := accountParams.Account; v != "" {
		db = db.Where("a.account=?", v)
	}
	if v := accountParams.LikeAccountName; v != "" {
		db = db.Where("a.name like ?", "%"+v+"%")
	}

	if v := accountParams.RolePK; v != 0 {
		db = db.Where("a.role_pk=?", v)
	}
	if v := accountParams.Status; v != 0 {
		db = db.Where("a.status=?", v)
	}
	if v := accountParams.ProvdID; v != 0 {
		db = db.Where("a.provider_id=?", v)
	}

	db = db.Select(
		`a.*, d.name as role_name,
		 d.type AS role_type `).Joins("a LEFT JOIN auth_role d ON a.role_pk=d.pk")

	db = db.Where("a.status != 3")
	db = db.Order("a.pk DESC")

	var result assembler.AccountProviders
	pr, err := repo.WrapPageQuery(db, accountParams.PaginationParam, &result)
	if err != nil {
		return result, nil, err
	}
	return result, pr, nil
}

// Update 更新服务商账号
func (p *providerRepo) Update(ctx context.Context, aid string, acctProvider model.AccountProvider) error {
	db := repo.GetDBWithTable(ctx, &model.AccountProvider{})
	err := db.Where("account_id=?", aid).Where("status<>3").Update(&acctProvider).Error
	if err != nil {
		return err
	}

	return nil
}

// Get 详情
func (p *providerRepo) Get(ctx context.Context, aid string) (assembler.AccountProvider, error) {
	db := repo.GetDBWithTable(ctx, &model.AccountProvider{})

	var item assembler.AccountProvider
	db = db.Joins("a LEFT JOIN account_provider_profile b ON a.account_id = b.account_id").
		Joins("LEFT JOIN auth_role c ON a.role_pk=c.pk")
	db = db.Select(`a.*, b.reg_code as reg_code, 
	b.contact as contact, b.phone as phone, b.address_detail as address_detail, b.email as email,
	c.name as role_name`)
	err := db.Where("a.account_id=?", aid).Where("a.status!=3").First(&item)
	if err != nil {
		return item, nil
	}

	return item, nil
}

// GetByAccount 账号查询详情
func (p *providerRepo) GetByAccount(ctx context.Context, account string, status int) (assembler.AccountProvider, error) {
	db := repo.GetDBWithTable(ctx, &model.AccountProvider{})

	var result assembler.AccountProvider
	if status != 0 {
		db = db.Where("status=?", status)
	}
	err := db.Where("account=?", account).Where("status<>3").First(&result).Error
	if err != nil {
		return result, err
	}

	return result, nil
}

// QueryAiotCustomer 服务商信息
func (p *providerRepo) QueryAiotCustomer(ctx context.Context, accountParams req.QueryAiotCustomerParams) (assembler.DcAiotCustomers, error) {
	db := repo.GetDBWithTable(ctx, &model.DcAiotCustomer{})
	if v := accountParams.LikeName; v != "" {
		db = db.Where("name like ?", "%"+v+"v")
	}
	subQ := repo.GetDBWithTable(ctx, &model.AccountProvider{}).Select("provider_id").Where("status<>3").SubQuery()

	db = db.Where("id NOT IN (?)", subQ)
	db = db.Order("id DESC")

	var result assembler.DcAiotCustomers
	err := db.Find(&result).Error
	if err != nil {
		return result, err
	}
	return result, nil
}
