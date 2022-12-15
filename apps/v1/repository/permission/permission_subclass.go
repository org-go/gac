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

type permissionSubclassRepo struct {
}

func (this permissionSubclassRepo) AddSubclassPermission(ctx context.Context, o model.AuthPermissionSubclass) (model.AuthPermissionSubclass, error) {
	db := repo.GetDBWithTable(ctx, &model.AuthPermissionSubclass{})
	err := db.Save(&o).Error
	return o, err
}

func (this permissionSubclassRepo) BatchAddSubclassPermission(ctx context.Context, o []interface{}) error {
	db := repo.GetDBWithTable(ctx, &model.AuthPermissionSubclass{})
	return gormbulk.BulkInsert(db, o, 2000)
}

func (this permissionSubclassRepo) UpdateSubclassPermission(ctx context.Context, o model.AuthPermissionSubclass) (model.AuthPermissionSubclass, error) {
	db := repo.GetDBWithTable(ctx, &model.AuthPermissionSubclass{})
	if v := o.Pk; v != 0 {
		db = db.Where(`pk = ?`, o.Pk)
	}
	if v := o.SubRolePk; v != 0 {
		db = db.Where(`sub_role_pk = ?`, o.Pk)
	}
	err := db.Update(&o).Error

	return o, err
}

func (this permissionSubclassRepo) UpdateSubclassPermissionStatus(ctx context.Context, opt req.UpdateSubclassPermissionStatusReq) error {
	db := repo.GetDBWithTable(ctx, &model.AuthPermissionSubclass{})

	if v := opt.SubRolePk; v != 0 {
		db = db.Where(`sub_role_pk = ?`, opt.SubRolePk)
	} else {
		return fmt.Errorf("sub_role_pk is null")
	}
	err := db.UpdateColumn(`status`, opt.Status).Error
	return err

}

func (this permissionSubclassRepo) SubclassPermissions(ctx context.Context, opt req.QuerySubclassPermissionReq) (assembler.PermissionSubclassAssemblers, error) {
	db := repo.GetDBWithTable(ctx, &model.AuthPermissionSubclass{})

	if v := opt.SubRolePk; v > 0 {
		db = db.Where("sub_role_pk=?", v)
	}
	db = db.Where("status=? ", 1)

	var result assembler.PermissionSubclassAssemblers
	err := db.Select("*").Find(&result).Error

	return result, err
}

func (this permissionSubclassRepo) SubclassPermissionsByMenuId(ctx context.Context, opt req.PermissionsByMenuIdReq) (assembler.PermissionSubclassAssemblers, error) {
	db := repo.GetDBWithTable(ctx, &model.AuthPermissionSubclass{})

	if v := opt.MenuPk; v > 0 {
		db = db.Where("FIND_IN_SET(?,permission_ids)", v)
	} else {
		return assembler.PermissionSubclassAssemblers{}, fmt.Errorf("menu_pk is null")
	}
	db = db.Where("status=? ", 1)

	var result assembler.PermissionSubclassAssemblers
	err := db.Select("*").Find(&result).Error

	return result, err
}
