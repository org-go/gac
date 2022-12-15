package account

import (
	"context"

	"payfun.gac.service/apps/v1/entity/model"
	"payfun.gac.service/apps/v1/repository/repo"
)

type accountRepo struct {
}

func (a *accountRepo) Create(ctx context.Context, ssoAccount model.SsoAccount) error {
	db := repo.GetDBWithTable(ctx, &model.SsoAccount{})
	err := db.Create(ssoAccount).Error
	if err != nil {
		return err
	}

	return nil
}
