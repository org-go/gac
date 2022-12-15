package role

import (
	"context"
	"encoding/json"
	"fmt"
	"payfun.gac.service/apps/v1/dto/common"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/entity/assembler"
	"payfun.gac.service/apps/v1/entity/model"
	"payfun.gac.service/apps/v1/repository/repo"
	"time"
)

type roleSubclassRepo struct {
}

func (this roleSubclassRepo) SubclassRoles(ctx context.Context, opt req.SubclassRolePageReq) (assembler.RoleSubclassAssemblers, *common.PaginationResult, error) {

	db := repo.GetDBWithTable(ctx, &model.AuthRoleSubclass{})
	if v := opt.Name; v != "" {
		db = db.Where("name like ?", v)
	}
	if v := opt.AccountId; v != "" {
		db = db.Where("account_id=?", v)
	}
	if v := opt.Status; v > 0 {
		db = db.Where("status=?", v)
	} else {
		db = db.Where("status in (?)", []int{1, 2})
	}

	if v := opt.CreatedUser; v != "" {
		db = db.Where("created_user like ?", v)
	}
	db = db.Where("type>0")

	db = db.Select(`*`)

	var result assembler.RoleSubclassAssemblers
	pr, err := repo.WrapPageQuery(db, opt.PaginationParam, &result)
	if err != nil {
		return nil, nil, err
	}
	return result, pr, nil
}

func (this roleSubclassRepo) SubclassRole(ctx context.Context, opt req.SubclassRoleReq) (assembler.RoleSubclassAssembler, error) {
	db := repo.GetDBWithTable(ctx, &model.AuthRoleSubclass{})
	if v := opt.Name; v != "" {
		db = db.Where("name like ?", v)
	}
	if v := opt.AccountId; v != "" {
		db = db.Where("account_id=?", v)
	}
	if v := opt.Status; v > 0 {
		db = db.Where("status=?", v)
	} else {
		db = db.Where("status in (?)", []int{1, 2})
	}

	if v := opt.CreatedUser; v != "" {
		db = db.Where("created_user like ?", v)
	}

	db = db.Select(`*`)
	var result assembler.RoleSubclassAssembler
	err := db.Find(&result).Error

	return result, err
}

func (this roleSubclassRepo) AddSubclassRole(ctx context.Context, o *model.AuthRoleSubclass) (*model.AuthRoleSubclass, error) {
	db := repo.GetDBWithTable(ctx, &model.AuthRoleSubclass{})
	err := db.Save(o).Error
	return o, err
}

func (this roleSubclassRepo) UpdateSubclassRole(ctx context.Context, o *model.AuthRoleSubclass) (*model.AuthRoleSubclass, error) {
	db := repo.GetDBWithTable(ctx, &model.AuthRoleSubclass{})
	if v := o.Pk; v != 0 {
		db = db.Where(`pk = ?`, o.Pk)
	} else {
		return o, fmt.Errorf("pk is null")
	}
	data, _ := json.Marshal(o)
	m := make(map[string]interface{})
	err := json.Unmarshal(data, &m)
	if err != nil {
		return nil, err
	}
	delete(m, "created_time")
	m["updated_time"] = time.Now()
	err = db.Update(m).Error

	return o, err
}

func (this roleSubclassRepo) UpdateSubclassRoleStatus(ctx context.Context, opt req.UpdateRoleStatusReq) error {
	db := repo.GetDBWithTable(ctx, &model.AuthRoleSubclass{})
	if v := opt.Pk; v != 0 {
		db = db.Where(`pk = ?`, opt.Pk)
	} else {
		return fmt.Errorf("pk is null")
	}
	err := db.UpdateColumn(`status`, opt.Status).Error
	return err

}
