package permission

import (
	"context"
	"fmt"

	gormbulk "github.com/t-tiger/gorm-bulk-insert"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/entity/assembler"
	"payfun.gac.service/apps/v1/entity/model"
	"payfun.gac.service/apps/v1/repository/repo"
)

type permissionRepo struct {
}

func (this permissionRepo) AddPermission(ctx context.Context, o model.AuthPermission) (model.AuthPermission, error) {
	db := repo.GetDBWithTable(ctx, &model.AuthPermission{})
	err := db.Save(&o).Error
	return o, err
}

func (this permissionRepo) BatchAddPermission(ctx context.Context, o []interface{}) error {
	db := repo.GetDBWithTable(ctx, &model.AuthPermission{})
	return gormbulk.BulkInsert(db, o, 2000)
}

func (this permissionRepo) UpdatePermission(ctx context.Context, o model.AuthPermission) (model.AuthPermission, error) {
	db := repo.GetDBWithTable(ctx, &model.AuthPermission{})
	if v := o.Pk; v != 0 {
		db = db.Where(`pk = ?`, o.Pk)
	}
	if v := o.RolePk; v != 0 {
		db = db.Where(`role_pk = ?`, o.Pk)
	}
	err := db.Update(&o).Error

	return o, err
}

func (this permissionRepo) UpdatePermissionStatus(ctx context.Context, opt req.UpdatePermissionStatusReq) error {
	db := repo.GetDBWithTable(ctx, &model.AuthPermission{})

	if v := opt.RolePk; v != 0 {
		db = db.Where(`role_pk = ?`, opt.RolePk)
	} else {
		return fmt.Errorf("role_pk is null")
	}
	err := db.UpdateColumn(`status`, opt.Status).Error
	return err

}

func (this permissionRepo) Permissions(ctx context.Context, opt req.QueryPermissionReq) (assembler.PermissionAssemblers, error) {
	db := repo.GetDBWithTable(ctx, &model.AuthPermission{})

	if v := opt.RolePk; v > 0 {
		db = db.Where("role_pk=?", v)
	}
	db = db.Where("status=? ", 1)

	var result assembler.PermissionAssemblers
	err := db.Select("*").Find(&result).Error

	return result, err
}

func (this permissionRepo) PermissionsByMenuId(ctx context.Context, opt req.PermissionsByMenuIdReq) (assembler.PermissionAssemblers, error) {
	db := repo.GetDBWithTable(ctx, &model.AuthPermission{})

	if v := opt.MenuPk; v > 0 {
		db = db.Where("FIND_IN_SET(?,permission_ids)", v)
	} else {
		return assembler.PermissionAssemblers{}, fmt.Errorf("menu_pk is null")
	}
	db = db.Where("status=? ", 1)

	var result assembler.PermissionAssemblers
	err := db.Select("*").Find(&result).Error

	return result, err
}
