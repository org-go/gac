package subclass

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

func (m subclassService) GetSubclassRolePage(ctx context.Context, opt req.SubclassRolePageReq) (assembler.RoleSubclassAssemblers, *common.PaginationResult, error) {
	repoRole := role.RepoRoleSubclass
	return repoRole.SubclassRoles(ctx, opt)
}

func (m subclassService) GetSubclassRoles(ctx context.Context, opt req.SubclassRoleReq) (assembler.RoleSubclassAssemblers, *common.PaginationResult, error) {
	repoRole := role.RepoRoleSubclass
	return repoRole.SubclassRoles(ctx, req.SubclassRolePageReq{
		PaginationParam: common.PaginationParam{},
		SubclassRoleReq: opt,
	})
}

func (m subclassService) AddSubclassRole(ctx context.Context, opt req.AddSubclassRoleReq) (*model.AuthRoleSubclass, error) {
	m.edge.WithLog(ctx, errx.AddSubclassRole, opt)
	repoRole := role.RepoRoleSubclass
	return repoRole.AddSubclassRole(ctx, &model.AuthRoleSubclass{
		Name:        opt.Name,
		Code:        opt.Code,
		Status:      opt.Status,
		Type:        1,
		Remark:      opt.Remark,
		AccountId:   opt.AccountId,
		CreatedTime: time.Now(),
		CreatedUser: opt.CreatedUser,
		CreatedIp:   opt.CreatedIp,
	})
}

func (m subclassService) UpdateSubclassRole(ctx context.Context, opt req.UpdateSubclassRoleReq) (*model.AuthRoleSubclass, error) {
	m.edge.WithLog(ctx, errx.UpdateSubclassRole, opt)
	if m.RoleHasAccount(ctx, req.UpdateRoleStatusReq{
		Pk: opt.Pk,
	}) {
		return &model.AuthRoleSubclass{}, fmt.Errorf("role has account")
	}
	repoRole := role.RepoRoleSubclass

	return repoRole.UpdateSubclassRole(ctx, &model.AuthRoleSubclass{
		Pk:          opt.Pk,
		Name:        opt.Name,
		Code:        opt.Code,
		Status:      opt.Status,
		Type:        1,
		AccountId:   opt.AccountId,
		Remark:      opt.Remark,
		CreatedIp:   opt.CreatedIp,
		CreatedUser: opt.CreatedUser,
	})
}

func (m subclassService) DisableSubclassRole(ctx context.Context, opt req.UpdateRoleStatusReq) error {
	m.edge.WithLog(ctx, errx.DisableSubclassRole, opt)
	if m.RoleHasAccount(ctx, opt) {
		return fmt.Errorf("role has account")
	}
	repoRole := role.RepoRoleSubclass
	return repoRole.UpdateSubclassRoleStatus(ctx, opt)
}

func (m subclassService) EnableSubclassRole(ctx context.Context, opt req.UpdateRoleStatusReq) error {
	m.edge.WithLog(ctx, errx.EnableSubclassRole, opt)
	if m.RoleHasAccount(ctx, opt) {
		return fmt.Errorf("role has account")
	}
	repoRole := role.RepoRoleSubclass
	return repoRole.UpdateSubclassRoleStatus(ctx, opt)
}

func (m subclassService) DelSubclassRole(ctx context.Context, opt req.UpdateRoleStatusReq) error {
	m.edge.WithLog(ctx, errx.DelSubclassRole, opt)
	if m.RoleHasAccount(ctx, opt) {
		return fmt.Errorf("role has account")
	}
	repoRole := role.RepoRoleSubclass
	return repoRole.UpdateSubclassRoleStatus(ctx, opt)
}

func (m subclassService) RoleHasAccount(ctx context.Context, opt req.UpdateRoleStatusReq) bool {
	accountByRole, _ := m.GetAccountProviderSubclassByRole(ctx, opt)
	return accountByRole.Pk > 0
}

func (m subclassService) GetAccountProviderSubclassByRole(ctx context.Context, opt req.UpdateRoleStatusReq) (sub assembler.AccountSubclassAssembler, err error) {
	repoSubclass := account.RepoSubclass
	return repoSubclass.Query(ctx, assembler.AccountSubclassAssembler{
		SubRolePk: opt.Pk,
		Status:    1,
	})

}
