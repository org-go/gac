package menu

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

type menuRepo struct {
}

func (this menuRepo) Menus(ctx context.Context, opt req.MenuReq) (assembler.MenuAssemblers, *common.PaginationResult, error) {

	db := repo.GetDBWithTable(ctx, &model.AuthMenu{})
	if v := opt.Name; v != "" {
		db = db.Where("a.name like ?", v)
	}
	if v := opt.Status; v > 0 {
		db = db.Where("a.status=?", v)
	} else {
		db = db.Where("a.status in (?)", []int{1, 2})
	}
	if v := opt.Pk; v > 0 {
		db = db.Where("a.pk =?", v)
	}
	if v := opt.Type; v > 0 {
		db = db.Where("a.type =?", v)
	}
	if v := opt.OrgPk; v > 0 {
		db = db.Where("a.org_pk=?", v)
	}
	if v := opt.AppPk; v > 0 {
		db = db.Where("a.app_pk=?", v)
	}
	if v := opt.Pks; len(v) > 0 {
		db = db.Where("a.pk in (?)", v)
	}
	if v := opt.Statues; len(v) > 0 {
		db = db.Where("a.status in (?)", v)
	}
	if v := opt.Types; len(v) > 0 {
		db = db.Where("a.type in (?)", v)
	}

	roleType := opt.RoleType
	if roleType == 1 {
		//  管理员角色 只展示GAC菜单
		db = db.Where("a.app_pk=1")
	} else if roleType == 2 {
		// SASS员工角色
		db = db.Where("c.type=2").Where("a.app_pk!=1")
	} else if roleType == 3 {
		// 服务商角色
		db = db.Where("c.type=3")
	}

	db = db.Select(`a.*,b.name org_name,c.name app_name,c.code app_code`)

	db = db.Joins("a LEFT JOIN admin_org b ON a.org_pk=b.pk ").
		Joins("LEFT JOIN admin_app c ON a.app_pk=c.pk").
		Order("a.parent_pk,a.type,a.sort")

	var result assembler.MenuAssemblers
	pr, err := repo.WrapPageQuery(db, opt.PaginationParam, &result)
	if err != nil {
		return nil, nil, err
	}
	return result, pr, nil
}

func (this menuRepo) Menu(ctx context.Context, opt req.MenuReq) (assembler.MenuAssembler, error) {
	db := repo.GetDBWithTable(ctx, &model.AuthMenu{})
	if v := opt.Pk; v > 0 {
		db = db.Where("a.pk=?", v)
	}
	if v := opt.ParentPk; v != "" {
		db = db.Where("a.parent_pk=?", v)
	}
	if v := opt.Status; v > 0 {
		db = db.Where("a.status=?", v)
	} else {
		db = db.Where("a.status in (?)", []int{1, 2})
	}
	if v := opt.OrgPk; v > 0 {
		db = db.Where("a.org_pk=?", v)
	}
	if v := opt.AppPk; v > 0 {
		db = db.Where("a.app_pk=?", v)
	}
	db = db.Select(`a.*,b.name org_name,c.name app_name`)

	db = db.Joins("a LEFT JOIN admin_org b ON a.org_pk=b.pk ").
		Joins("LEFT JOIN admin_app c ON a.app_pk=c.pk").
		Order("a.sort DESC")
	var result assembler.MenuAssembler
	err := db.Find(&result).Error

	return result, err
}

func (this menuRepo) AddMenu(ctx context.Context, o *model.AuthMenu) (*model.AuthMenu, error) {
	db := repo.GetDBWithTable(ctx, &model.AuthMenu{})
	err := db.Save(o).Error
	return o, err
}

func (this menuRepo) UpdateMenu(ctx context.Context, o *model.AuthMenu) (*model.AuthMenu, error) {
	db := repo.GetDBWithTable(ctx, &model.AuthMenu{})
	if v := o.Pk; v != 0 {
		db = db.Where(`pk = ?`, o.Pk)
	} else {
		return o, fmt.Errorf("pk is null")
	}
	data, _ := json.Marshal(o)
	m := make(map[string]interface{})
	json.Unmarshal(data, &m)
	delete(m, "created_time")
	m["updated_time"] = time.Now()
	err := db.Update(m).Error

	return o, err
}

func (this menuRepo) UpdateParentMenuInfo(ctx context.Context, o *model.AuthMenu) error {
	db := repo.GetDBWithTable(ctx, &model.AuthMenu{})
	if v := o.Pk; v != 0 {
		db = db.Where(`parent_pk = ?`, o.Pk)
	} else {
		return fmt.Errorf("pk is null")
	}
	err := db.UpdateColumn(`parent_name`, o.ParentName).Error
	return err
}

func (this menuRepo) UpdateMenuStatus(ctx context.Context, opt req.UpdateMenuStatusReq) error {
	db := repo.GetDBWithTable(ctx, &model.AuthMenu{})
	if v := opt.Pk; v != 0 {
		db = db.Where(`pk = ?`, opt.Pk)
	}
	if v := opt.Pks; len(v) > 0 {
		db = db.Where(`pk in (?)`, opt.Pks)
	}
	err := db.UpdateColumn(`status`, opt.Status).Error
	return err

}

func (this menuRepo) MenusByParentId(ctx context.Context, opt req.MenuReq) (assembler.MenuAssemblers, error) {
	db := repo.GetDBWithTable(ctx, &model.AuthMenu{})

	if v := opt.Pk; v > 0 {
		db = db.Where("FIND_IN_SET(?,joins)", v)
	} else {
		return assembler.MenuAssemblers{}, fmt.Errorf("pk is null")
	}
	db = db.Where("status=? ", 1)

	var result assembler.MenuAssemblers
	err := db.Select("*").Find(&result).Error

	return result, err
}
