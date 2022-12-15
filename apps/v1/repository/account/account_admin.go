package account

import (
	"context"

	"payfun.gac.service/apps/v1/dto/common"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/entity/assembler"
	"payfun.gac.service/apps/v1/entity/model"
	"payfun.gac.service/apps/v1/repository/repo"
)

type adminRepo struct {
}

// Create 创建内部员工
func (a *adminRepo) Create(ctx context.Context, actadmin model.AccountAdmin) error {
	db := repo.GetDBWithTable(ctx, &model.AccountAdmin{})
	err := db.Create(actadmin).Error
	if err != nil {
		return err
	}

	return nil
}

func (a *adminRepo) Query(ctx context.Context, actadminParams req.QueryAccountParams) (assembler.AccountAdmins, *common.PaginationResult, error) {
	db := repo.GetDBWithTable(ctx, &model.AccountAdmin{})

	if v := actadminParams.Account; v != "" {
		db = db.Where("a.account=?", v)
	}
	if v := actadminParams.LikeAccountName; v != "" {
		db = db.Where("a.name like ?", "%"+v+"%")
	}

	if v := actadminParams.CreatorName; v != "" {
		db = db.Where("b.name=?", v)
	}
	if v := actadminParams.CreatorAccountType; v != "" {
		switch v {
		case "A":
			db = db.Where("b.is_admin=1")

		case "B":
			db = db.Where("c.type=1")
		case "C":
			db = db.Where("c.type=2")
		default:
		}
	}
	if v := actadminParams.RoleType; v != 0 {
		db = db.Where("d.type=?", v)
	}
	if v := actadminParams.RolePK; v != 0 {
		db = db.Where("a.role_pk=?", v)
	}
	if v := actadminParams.Status; v != 0 {
		db = db.Where("a.status=?", v)
	}

	db = db.Select(
		`a.*, b.name as creator_name, d.name as role_name,
		CASE
			WHEN b.is_admin = 1 THEN "A"
			WHEN b.is_admin=0 AND c.type = 1 THEN "B"
			WHEN b.is_admin=0 AND c.type = 2 THEN "C"
			ELSE ""
		END AS creator_account_type,
		CASE
			WHEN a.is_admin = 1 THEN "A"
			WHEN a.is_admin=0 AND d.type = 1 THEN "B"
			WHEN a.is_admin=0 AND d.type = 2 THEN "C"
			ELSE ""
		END AS role_type
	 	`).Joins("a LEFT JOIN account_admin b ON a.created_id = b.account_id").
		Joins("LEFT JOIN auth_role c ON b.role_pk=c.pk").
		Joins(" LEFT JOIN auth_role d ON a.role_pk=d.pk")

	db = db.Where("a.status != 3")
	db = db.Order("a.pk DESC")

	var result assembler.AccountAdmins
	pr, err := repo.WrapPageQuery(db, actadminParams.PaginationParam, &result)
	if err != nil {
		return nil, nil, err
	}

	return result, pr, nil
}

func (a *adminRepo) Update(ctx context.Context, aid string, actadmin model.AccountAdmin) error {
	db := repo.GetDBWithTable(ctx, &model.AccountAdmin{})
	err := db.Where("account_id=?", aid).Where("status<>3").Where("is_admin<>1").Update(&actadmin).Error
	if err != nil {
		return err
	}

	return nil
}

func (a *adminRepo) Get(ctx context.Context, aid string) (assembler.AccountAdmin, error) {
	db := repo.GetDBWithTable(ctx, &model.AccountAdmin{})

	var result assembler.AccountAdmin
	err := db.Where("account_id=?", aid).Where("status<>3").First(&result).Error
	if err != nil {
		return result, err
	}

	return result, nil
}

func (a *adminRepo) GetByAccount(ctx context.Context, account string) (assembler.AccountAdmin, error) {
	db := repo.GetDBWithTable(ctx, &model.AccountAdmin{})

	var result assembler.AccountAdmin
	err := db.Where("account=?", account).Where("status<>3").First(&result).Error
	if err != nil {
		return result, err
	}

	return result, nil
}
