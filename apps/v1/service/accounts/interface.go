package accounts

import (
	"github.com/gin-gonic/gin"
	"payfun.gac.service/apps/v1/dto/common"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/dto/resp"
	"payfun.gac.service/apps/v1/entity/assembler"
)

type (

	// iAccountSvcInterface
	iAccountSvcInterface interface {
	}

	// iActAdminSvcInterface
	iActAdminSvcInterface interface {
		// Query 内部员工账户列表查询
		Query(c *gin.Context, accountParams req.QueryAccountParams) (assembler.AccountAdmins, *common.PaginationResult, error)
		// Create 创建
		Create(c *gin.Context, accadmin req.AccountAdmin) error
		// Login 登录
		Login(c *gin.Context, accountLogin req.AccountLogin) (*resp.LoginResp, error)
		// Enable 启用
		Enable(c *gin.Context, aid string) error
		// Disable 禁用
		Disable(c *gin.Context, aid string) error
		// Delete 删除
		Delete(c *gin.Context, aid string) error
		// Update
		Update(c *gin.Context, aid string, accadmin req.UpdateAccountAdmin) error
		// ResetPassword 重置密码
		ResetPassword(c *gin.Context, aid string) error
		// Get 查询员工列表详情
		Get(c *gin.Context, aid string) (assembler.AccountAdmin, error)
		// UpdatePassword 更新密码
		UpdatePassword(c *gin.Context, aid string, acct req.AcctChangePasswd) error
	}

	//  iAccountSubclassInterface
	iAccountSubclassInterface interface {

		// Create
		Create(c *gin.Context, sub assembler.AccountSubclassAssembler) error
		// Enable
		Enable(c *gin.Context, id string) error
		// Disable
		Disable(c *gin.Context, id string) error
		// Delete
		Delete(c *gin.Context, id string) error
		//  Page
		Page(c *gin.Context, searchReq req.AccountSubclassSearchReq) (subs resp.AccountSubclassResps, page *common.PaginationResult, err error)
	}
)

type (
	// iAcctProvSvcInterface 服务商
	iAcctProvSvcInterface interface {
		// Create 创建
		Create(c *gin.Context, accaprovd req.AccountProvider) error
		// 查询
		Query(c *gin.Context, accountParams req.QueryProvdAccountParams) (assembler.AccountProviders, *common.PaginationResult, error)
		// Login 登录
		Login(c *gin.Context, accountLogin req.AccountLogin) (*resp.LoginResp, error)
		// Enable 启用
		Enable(c *gin.Context, aid string) error
		// 禁用
		Disable(c *gin.Context, aid string) error
		// Delete 删除
		Delete(c *gin.Context, aid string) error
		// Update 更新
		Update(c *gin.Context, aid string, accProvd req.AccountProvider) error
		// QueryAiotCustomer 查询服务商
		QueryAiotCustomer(c *gin.Context, params req.QueryAiotCustomerParams) (assembler.DcAiotCustomers, error)
		// Get 获取详情
		Get(c *gin.Context, aid string) (assembler.AccountProvider, error)
		// ResetPassword 重置密码
		ResetPassword(c *gin.Context, aid string) error
		// UpdatePassword 修改密码
		UpdatePassword(c *gin.Context, aid string, accProvd req.AcctChangePasswd) error
	}
)
