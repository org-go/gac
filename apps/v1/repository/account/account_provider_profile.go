package account

import (
	"context"

	"payfun.gac.service/apps/v1/entity/model"
	"payfun.gac.service/apps/v1/repository/repo"
)

type acctProviderProfileRepo struct {
}

// Create 创建服务商账号
func (p *acctProviderProfileRepo) Create(ctx context.Context, acctProvdPf model.AccountProviderProfile) error {
	db := repo.GetDBWithTable(ctx, &model.AccountProviderProfile{})
	err := db.Create(acctProvdPf).Error
	if err != nil {
		return err
	}

	return nil
}

// GetByAcctID 详情
func (p *acctProviderProfileRepo) GetByAcctID(ctx context.Context, aid string) (model.AccountProviderProfile, error) {
	db := repo.GetDBWithTable(ctx, &model.AccountProvider{})

	var item model.AccountProviderProfile

	err := db.Where("account_id=?", aid).First(&item)
	if err != nil {
		return item, nil
	}

	return item, nil
}

// GetByProvdID 详情
func (p *acctProviderProfileRepo) GetByProvdID(ctx context.Context, provdID int) (model.AccountProviderProfile, error) {
	db := repo.GetDBWithTable(ctx, &model.DcAiotCustomer{})

	var item model.AccountProviderProfile

	err := db.Where("id=?", provdID).First(&item)
	if err != nil {
		return item, nil
	}

	return item, nil
}
