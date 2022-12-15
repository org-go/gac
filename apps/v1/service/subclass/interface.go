package subclass

import (
	"context"
	"github.com/gin-gonic/gin"
	"payfun.gac.service/apps/v1/dto/common"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/dto/resp"
	"payfun.gac.service/apps/v1/entity/assembler"
	"payfun.gac.service/apps/v1/entity/model"
)

type (

	// iSubclassSvcInterface
	iSubclassSvcInterface interface {
		//  iSubclassMenuSvcInterface 子账户菜单
		iSubclassMenuSvcInterface
		//  iAccountSubclassInterface 子账户信息
		iAccountSubclassInterface
		//  iAuthSubclassInterface	  我的子账户
		iAuthSubclassInterface
	}

	iSubclassMenuSvcInterface interface {
		GetMenuPage(ctx context.Context, opt req.SubclassMenuReq) (assembler.MenuAssemblers, *common.PaginationResult, error)

		GetSubclassRolePage(ctx context.Context, opt req.SubclassRolePageReq) (assembler.RoleSubclassAssemblers, *common.PaginationResult, error)
		GetSubclassRoles(ctx context.Context, opt req.SubclassRoleReq) (assembler.RoleSubclassAssemblers, *common.PaginationResult, error)
		AddSubclassRole(ctx context.Context, opt req.AddSubclassRoleReq) (*model.AuthRoleSubclass, error)
		UpdateSubclassRole(ctx context.Context, opt req.UpdateSubclassRoleReq) (*model.AuthRoleSubclass, error)
		DisableSubclassRole(ctx context.Context, opt req.UpdateRoleStatusReq) error
		EnableSubclassRole(ctx context.Context, opt req.UpdateRoleStatusReq) error
		DelSubclassRole(ctx context.Context, opt req.UpdateRoleStatusReq) error

		BindSubclassPermission(ctx context.Context, opt req.AddSubclassPermissionReq) error
		QuerySubclassPermission(ctx context.Context, opt req.QuerySubclassPermissionReq) (resp.QueryPermissionResp, error)
		DealSubclassPermissionRedis(ctx context.Context, opt req.AddSubclassPermissionReq) error
	}

	//  iAccountSubclassInterface 子账户
	iAccountSubclassInterface interface {

		// CreateSubclassAccount
		CreateSubclassAccount(c *gin.Context, sub assembler.AccountSubclassAssembler) error
		// EnableSubclassAccount
		EnableSubclassAccount(c *gin.Context, id string) error
		// DisableSubclassAccount
		DisableSubclassAccount(c *gin.Context, id string) error
		// DeleteSubclassAccount
		DeleteSubclassAccount(c *gin.Context, id string) error
		//  GetSubclassAccountPage
		GetSubclassAccountPage(c *gin.Context, searchReq req.AccountSubclassSearchReq) (subs resp.AccountSubclassResps, page *common.PaginationResult, err error)
		//  BindSubclassAccountRole
		BindSubclassAccountRole(c *gin.Context, id string, subRolePk int32) error
	}

	//  iAuthSubclassInterface  我的子账户信息
	iAuthSubclassInterface interface {
		//  SelfGetSubclassAccountInfo
		SelfGetSubclassAccountInfo(c *gin.Context) (info resp.AccountSubclassResp)
		// SelfUpdateSubclassAccount
		SelfUpdateSubclassAccount(c *gin.Context, opt req.AuthSubclassUpdateReq) error
		//  SelfRestSubclassAccountPassword
		SelfRestSubclassAccountPassword(c *gin.Context, password req.AuthSubclassResetPasswordReq) error
		//  Login
		Login(c *gin.Context, opt req.AccountLogin) (sub assembler.AccountSubclassAssembler, err error)
	}
)
