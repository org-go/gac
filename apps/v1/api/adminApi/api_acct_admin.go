package adminApi

import (
	"github.com/gin-gonic/gin"
	"payfun.gac.service/apps/meta/contextx"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/service/accounts"
)

// AdminAPI 内部员工接口
type AdminAPI struct {
}

// Create 创建
// @Summary 创建管理员账户
// @Description 创建管理员账户
// @Tags GAC/账户管理
// @Produce  json
// @param authorization header string false "Authorization"
// @Param body body req.AccountAdmin true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Router /admin/accounts/create [POST]
func (*AdminAPI) Create(c *gin.Context) {
	var accountAdmin req.AccountAdmin
	err := c.ShouldBindJSON(&accountAdmin)
	if err != nil {
		failure(c, err.Error())
		return
	}
	if accountAdmin.Password == "" {
		accountAdmin.Password = "a123456"
	}
	err = accounts.AdminSvc().Create(c, accountAdmin)
	if err != nil {
		failure(c, err.Error())
		return
	}
	success(c, "OK")
}

type token struct{}

// Login 登录
// @Summary 登录
// @Description 登录
// @Tags GAC/账户管理
// @Produce  json
// @Param body body req.AccountLogin true "The object content"
// @Success 200 {object}  Response{data=resp.LoginResp{token=token{access_token=string,expiry=string}}} "expiry:时间"
// @Failure 400 {object}  Response
// @Router /admin/login [POST]
func (*AdminAPI) Login(c *gin.Context) {
	var accountLogin req.AccountLogin
	err := c.ShouldBindJSON(&accountLogin)
	if err != nil {
		failure(c, err.Error())
		return
	}

	rsp, err := accounts.AdminSvc().Login(c, accountLogin)
	if err != nil {
		failure(c, err.Error())
		return
	}
	success(c, rsp)
}

// Get 获取用户详情
func (*AdminAPI) Get(c *gin.Context) {
	auth := contextx.FromAuthorized(c)
	rsp, err := accounts.AdminSvc().Get(c, auth.AccountID)
	if err != nil {
		failure(c, err.Error())
		return
	}
	success(c, rsp)
}

// Query 查询用户列表
// @Summary 查询用户列表
// @Description 查询用户列表
// @Tags GAC/账户管理
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
// @Success 200 {object}  Response{data=PageData{data=assembler.AccountAdmins}} "expiry:时间"
// @Failure 400 {object}  Response
// @Router /admin/accounts/page [GET]
func (*AdminAPI) Query(c *gin.Context) {
	var accoutQueryParams req.QueryAccountParams
	err := c.ShouldBindQuery(&accoutQueryParams)
	if err != nil {
		failure(c, "params error")
		return
	}

	accoutQueryParams.RoleType = 1
	accadmins, pr, err := accounts.AdminSvc().Query(c, accoutQueryParams)
	if err != nil {
		failure(c, "query error")
		return
	}

	success(c, PageData{
		List:       accadmins,
		Pagination: pr,
	})
}

// Disable 禁用/启用
// @Summary 禁用/启用
// @Description 禁用/启用
// @Tags GAC/账户管理
// @Produce  json
// @Param authorization header string false "Authorization"
// @Param body body req.AccountOperation true "The object content"
// @Success 200 {object}  Response "data=OK"
// @Failure 400 {object}  Response
// @Router /admin/accounts/disable [POST]
func (*AdminAPI) Disable(c *gin.Context) {
	var accoper req.AccountOperation
	err := c.ShouldBindJSON(&accoper)
	if err != nil {
		failure(c, err.Error())
		return
	}

	if accoper.Status == 1 {
		err = accounts.AdminSvc().Enable(c, accoper.AccountID)
		if err != nil {
			failure(c, "internal error")
			return
		}
	} else if accoper.Status == 2 {
		err = accounts.AdminSvc().Disable(c, accoper.AccountID)
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
// @Tags GAC/账户管理
// @Produce  json
// @Param authorization header string false "Authorization"
// @Param body body req.AccountOperation true "The object content"
// @Success 200 {object}  Response "data=OK"
// @Failure 400 {object}  Response
// @Router /admin/accounts/delete [POST]
func (*AdminAPI) Delete(c *gin.Context) {
	var accoper req.AccountOperation
	err := c.ShouldBindJSON(&accoper)
	if err != nil {
		failure(c, err.Error())
		return
	}

	err = accounts.AdminSvc().Delete(c, accoper.AccountID)
	if err != nil {
		failure(c, "internal error")
		return
	}
	success(c, "OK")
}

// Update 更新
// @Summary 更新
// @Description 更新
// @Tags GAC/账户管理
// @Produce  json
// @Param authorization header string false "Authorization"
// @Param body body req.UpdateAccountAdmin true "The object content"
// @Success 200 {object}  Response "data=OK"
// @Failure 400 {object}  Response
// @Router /admin/accounts/update [POST]
func (*AdminAPI) Update(c *gin.Context) {
	var accadmin req.UpdateAccountAdmin
	err := c.ShouldBindJSON(&accadmin)
	if err != nil {
		failure(c, err.Error())
		return
	} else if accadmin.AccountID == "" {
		failure(c, "params error")
		return
	}

	err = accounts.AdminSvc().Update(c, accadmin.AccountID, accadmin)
	if err != nil {
		failure(c, "internal error")
		return
	}
	success(c, "OK")
}

// ResetPassword 重置密码
// @Summary 重置密码
// @Description 重置密码
// @Tags GAC/账户管理
// @Produce  json
// @Param authorization header string false "Authorization"
// @Param body body req.ResetAccount true "The object content"
// @Success 200 {object}  Response "data=OK"
// @Failure 400 {object}  Response
// @Router /admin/accounts/reset_password [POST]
func (*AdminAPI) ResetPassword(c *gin.Context) {
	var reset req.ResetAccount
	err := c.ShouldBindJSON(&reset)
	if err != nil {
		failure(c, err.Error())
		return
	} else if reset.AccountID == "" {
		failure(c, "params error")
		return
	}

	err = accounts.AdminSvc().ResetPassword(c, reset.AccountID)
	if err != nil {
		failure(c, "internal error")
		return
	}
	success(c, "OK")
}
