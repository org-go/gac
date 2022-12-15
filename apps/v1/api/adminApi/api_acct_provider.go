package adminApi

import (
	"github.com/gin-gonic/gin"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/service/accounts"
)

// ProvdAPI 服务商接口
type ProvdAPI struct {
}

// Create 创建
// @Summary 创建服务商账户
// @Description 创建服务商账户
// @Tags GAC/服务商账户管理
// @Produce  json
// @param authorization header string false "Authorization"
// @Param body body req.AccountProvider true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Router /admin/provd/accounts/create [POST]
func (*ProvdAPI) Create(c *gin.Context) {
	var accountProvd req.AccountProvider
	err := c.ShouldBindJSON(&accountProvd)
	if err != nil {
		failure(c, err.Error())
		return
	}
	err = accounts.ProvdSvc().Create(c, accountProvd)
	if err != nil {
		failure(c, err.Error())
		return
	}
	success(c, "OK")
}

// Get 获取用户详情
func (*ProvdAPI) Get(c *gin.Context) {

}

// Query 查询用户列表
// @Summary 查询用户列表
// @Description 查询用户列表
// @Tags GAC/服务商账户管理
// @Produce  json
// @Param authorization header string false "Authorization"
// @Param current query int false "分页索引" default(1)
// @Param page_size query int false "分页大小" default(10)
// @Param pagination query bool true "是否分页" default(true)
// @Param account query string false "账号"
// @Param like_account_name query string false "账号名称模糊查询"
// @Param role_pk query int false "角色pk"
// @Param creator_name query string false "创建人名称"
// @Param creator_account_type query string false "创建人账户类别(A:超管 B:管理员 C:员工)"
// @Param status query int false "状态：1:启用 2：停用"
// @Param role_type query int false "角色类别 1:gac管理员 2：sass员工 3：sass服务商"
// @Success 200 {object}  Response{data=PageData{data=assembler.AccountProviders}} "expiry:时间"
// @Failure 400 {object}  Response
// @Router /admin/provd/accounts/page [GET]
func (*ProvdAPI) Query(c *gin.Context) {
	var accoutQueryParams req.QueryProvdAccountParams
	err := c.ShouldBindQuery(&accoutQueryParams)
	if err != nil {
		failure(c, "params error")
		return
	}

	accountProviders, pr, err := accounts.ProvdSvc().Query(c, accoutQueryParams)
	if err != nil {
		failure(c, "query error")
		return
	}

	success(c, PageData{
		List:       accountProviders,
		Pagination: pr,
	})
}

// Disable 禁用/启用
// @Summary 禁用/启用
// @Description 禁用/启用
// @Tags GAC/服务商账户管理
// @Produce  json
// @Param authorization header string false "Authorization"
// @Param body body req.AccountOperation true "The object content"
// @Success 200 {object}  Response "data=OK"
// @Failure 400 {object}  Response
// @Router /admin/provd/accounts/disable [POST]
func (*ProvdAPI) Disable(c *gin.Context) {
	var accoper req.AccountOperation
	err := c.ShouldBindJSON(&accoper)
	if err != nil {
		failure(c, err.Error())
		return
	}

	if accoper.Status == 1 {
		err = accounts.ProvdSvc().Enable(c, accoper.AccountID)
		if err != nil {
			failure(c, "internal error")
			return
		}
	} else if accoper.Status == 2 {
		err = accounts.ProvdSvc().Disable(c, accoper.AccountID)
		if err != nil {
			failure(c, "internal error")
			return
		}
	}

	success(c, "OK")
}

// Delete 删除
// @Summary 删除
// @Description 删除
// @Tags GAC/服务商账户管理
// @Produce  json
// @Param authorization header string false "Authorization"
// @Param body body req.AccountOperation true "The object content"
// @Success 200 {object}  Response "data=OK"
// @Failure 400 {object}  Response
// @Router /admin/provd/accounts/delete [POST]
func (*ProvdAPI) Delete(c *gin.Context) {
	var accoper req.AccountOperation
	err := c.ShouldBindJSON(&accoper)
	if err != nil {
		failure(c, err.Error())
		return
	}

	err = accounts.ProvdSvc().Delete(c, accoper.AccountID)
	if err != nil {
		failure(c, "internal error")
		return
	}
	success(c, "OK")
}

// Update 更新
// @Summary 更新
// @Description 更新
// @Tags GAC/服务商账户管理
// @Produce  json
// @Param authorization header string false "Authorization"
// @Param body body req.AccountProvider true "The object content"
// @Success 200 {object}  Response "data=OK"
// @Failure 400 {object}  Response
// @Router /admin/provd/accounts/update [POST]
func (*ProvdAPI) Update(c *gin.Context) {
	var acctProvd req.AccountProvider
	err := c.ShouldBindJSON(&acctProvd)
	if err != nil {
		failure(c, err.Error())
		return
	} else if acctProvd.AccountID == "" {
		failure(c, "params error")
		return
	}

	err = accounts.ProvdSvc().Update(c, acctProvd.AccountID, acctProvd)
	if err != nil {
		failure(c, "internal error")
		return
	}
	success(c, "OK")
}

// QueryList 查询服务商列表
// @Summary 查询服务商列表
// @Description 查询服务商列表
// @Tags GAC/服务商账户管理
// @Produce  json
// @Param authorization header string false "Authorization"
// @Param like_name query string false "名称模糊查询"
// @Success 200 {object}  Response{data=PageData{data=assembler.DcAiotCustomers}} "无分页"
// @Failure 400 {object}  Response
// @Router /admin/provd/provider/list [GET]
func (*ProvdAPI) QueryList(c *gin.Context) {
	var params req.QueryAiotCustomerParams
	err := c.ShouldBindQuery(&params)
	if err != nil {
		failure(c, "params error")
		return
	}

	accountProviders, err := accounts.ProvdSvc().QueryAiotCustomer(c, params)
	if err != nil {
		failure(c, "query error")
		return
	}

	success(c, PageData{
		List:       accountProviders,
		Pagination: nil,
	})
}

// ResetPassword 重置密码
// @Summary 重置密码
// @Description 重置密码
// @Tags GAC/服务商账户管理
// @Produce  json
// @Param authorization header string false "Authorization"
// @Param body body req.ResetAccount true "The object content"
// @Success 200 {object}  Response "data=OK"
// @Failure 400 {object}  Response
// @Router /admin/provd/provider/reset_password [POST]
func (*ProvdAPI) ResetPassword(c *gin.Context) {
	var reset req.ResetAccount
	err := c.ShouldBindJSON(&reset)
	if err != nil {
		failure(c, err.Error())
		return
	} else if reset.AccountID == "" {
		failure(c, "params error")
		return
	}

	err = accounts.ProvdSvc().ResetPassword(c, reset.AccountID)
	if err != nil {
		failure(c, "internal error")
		return
	}
	success(c, "OK")
}
