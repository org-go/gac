package admins

import (
	"context"
	"fmt"
	"payfun.gac.service/apps/errx"
	"payfun.gac.service/apps/v1/dto/common"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/entity/assembler"
	"payfun.gac.service/apps/v1/entity/model"
	"payfun.gac.service/apps/v1/repository/account"
	"payfun.gac.service/apps/v1/repository/role"
	"time"
)

func (m adminService) GetRolePage(ctx context.Context, opt req.RolePageReq) (assembler.RoleAssemblers, *common.PaginationResult, error) {
	repoRole := role.RepoRole
	return repoRole.Roles(ctx, opt)
}

func (m adminService) GetRoles(ctx context.Context, opt req.RoleReq) (assembler.RoleAssemblers, *common.PaginationResult, error) {
	repoRole := role.RepoRole
	return repoRole.Roles(ctx, req.RolePageReq{
		PaginationParam: common.PaginationParam{},
		RoleReq:         opt,
	})
}

func (m adminService) AddRole(ctx context.Context, opt req.AddRoleReq) (*model.AuthRole, error) {
	m.edge.WithLog(ctx, errx.AddRole, opt)
	repoRole := role.RepoRole
	return repoRole.AddRole(ctx, &model.AuthRole{
		Name:        opt.Name,
		Code:        opt.Code,
		Status:      opt.Status,
		Type:        opt.Type,
		Remark:      opt.Remark,
		CreatedTime: time.Now(),
		CreatedUser: opt.CreatedUser,
		CreatedIp:   opt.CreatedIp,
	})
}

func (m adminService) UpdateRole(ctx context.Context, opt req.UpdateRoleReq) (*model.AuthRole, error) {
	m.edge.WithLog(ctx, errx.UpdateRole, opt)
	if m.RoleHasAccount(ctx, req.UpdateRoleStatusReq{
		Pk: opt.Pk,
	}) {
		return &model.AuthRole{}, fmt.Errorf("role has account")
	}
	repoRole := role.RepoRole

	return repoRole.UpdateRole(ctx, &model.AuthRole{
		Pk:          opt.Pk,
		Name:        opt.Name,
		Code:        opt.Code,
		Status:      opt.Status,
		Type:        opt.Type,
		Remark:      opt.Remark,
		CreatedIp:   opt.CreatedIp,
		CreatedUser: opt.CreatedUser,
	})
}

func (m adminService) DisableRole(ctx context.Context, opt req.UpdateRoleStatusReq) error {
	m.edge.WithLog(ctx, errx.DisableRole, opt)
	if m.RoleHasAccount(ctx, opt) {
		return fmt.Errorf("role has account")
	}
	repoRole := role.RepoRole
	return repoRole.UpdateRoleStatus(ctx, opt)
}

func (m adminService) EnableRole(ctx context.Context, opt req.UpdateRoleStatusReq) error {
	m.edge.WithLog(ctx, errx.EnableRole, opt)
	if m.RoleHasAccount(ctx, opt) {
		return fmt.Errorf("role has account")
	}
	repoRole := role.RepoRole
	return repoRole.UpdateRoleStatus(ctx, opt)
}

func (m adminService) DelRole(ctx context.Context, opt req.UpdateRoleStatusReq) error {
	m.edge.WithLog(ctx, errx.DelRole, opt)
	if m.RoleHasAccount(ctx, opt) {
		return fmt.Errorf("role has account")
	}
	repoRole := role.RepoRole
	return repoRole.UpdateRoleStatus(ctx, opt)
}

func (m adminService) RoleHasAccount(ctx context.Context, opt req.UpdateRoleStatusReq) bool {
	accountByRole, _, _ := m.GetAdminAccountByRole(ctx, opt)
	if len(accountByRole) > 0 {
		return true
	} else {
		accountByRole, _, _ := m.GetProviderAccountByRole(ctx, opt)
		return len(accountByRole) > 0
	}
}

func (m adminService) GetAdminAccountByRole(ctx context.Context, opt req.UpdateRoleStatusReq) (assembler.AccountAdmins, *common.PaginationResult, error) {
	repoAccountAdmin := account.RepoAccountAdmin
	return repoAccountAdmin.Query(ctx, req.QueryAccountParams{
		RolePK: int(opt.Pk),
		Status: 1,
	})

}

func (m adminService) GetProviderAccountByRole(ctx context.Context, opt req.UpdateRoleStatusReq) (assembler.AccountProviders, *common.PaginationResult, error) {
	repoAcctProvd := account.RepoAcctProvd
	return repoAcctProvd.Query(ctx, req.QueryProvdAccountParams{
		QueryAccountParams: req.QueryAccountParams{
			RolePK: int(opt.Pk),
			Status: 1,
		},
	})
}
