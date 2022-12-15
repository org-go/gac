package ssoApi

import (
	"github.com/gin-gonic/gin"
	"github.com/go-playground/validator/v10"
	"payfun.gac.service/apps/errx"
	"payfun.gac.service/apps/v1/dto/req"
	"payfun.gac.service/apps/v1/entity/assembler"
	"payfun.gac.service/apps/v1/service/subclass"
)

type SsoAccountSubclassApi struct{}

//
// @Summary 创建子账户
// @Description
// @Tags SSO/子账户管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body req.AccountSubclassCreateReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /sso/subclass/create [POST]
func (a *SsoAccountSubclassApi) Create(c *gin.Context) {

    var opt req.AccountSubclassCreateReq
    defer logError(c)
    err, _ := c.ShouldBindJSON(&opt).(validator.ValidationErrors)
    if err != nil {
        panic(err)
    }

    e := subclass.Svc().CreateSubclassAccount(c, assembler.AccountSubclassAssembler{
        Name:      opt.Name,
        Account:   opt.Account,
        Password:  opt.Password,
    })
    if e != nil {
        panic(e.Error())
    }
    success(c, `ok`)

}

//
// @Summary 子账户分页列表
// @Description
// @Tags SSO/子账户管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body req.AccountSubclassSearchReq true "The object content"
// @Success 200 {object}  Response{data=resp.AccountSubclassResps}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /sso/subclass/page [POST]
func (a *SsoAccountSubclassApi) Page(c *gin.Context) {


    var opt req.AccountSubclassSearchReq
    defer logError(c)
    err, _ := c.ShouldBindJSON(&opt).(validator.ValidationErrors)
    if err != nil {
        panic(err)
    }
    data, page, _ := subclass.Svc().GetSubclassAccountPage(c, opt)


	success(c, PageData{List: data, Pagination: page})

}



//
// @Summary 启用/禁用子账户
// @Description
// @Tags SSO/子账户管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body req.AccountSubclassStatusReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /sso/subclass/disable [POST]
func (a *SsoAccountSubclassApi) Disable(c *gin.Context) {


    var opt req.AccountSubclassStatusReq
    defer logError(c)
    err, _ := c.ShouldBindJSON(&opt).(validator.ValidationErrors)
    if err != nil {
        panic(err)
    }
    var e error
    switch opt.Status {
    case 1:
        e = subclass.Svc().EnableSubclassAccount(c, opt.ID)
    case 2:
        e = subclass.Svc().DisableSubclassAccount(c, opt.ID)
    }
    if e != nil {
        panic(errx.EditSubclass.CodeError())
    }
	success(c, `ok`)

}

//
// @Summary 删除子账户
// @Description
// @Tags SSO/子账户管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body req.AccountSubclassStatusReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /sso/subclass/delete [POST]
func (a *SsoAccountSubclassApi) Delete(c *gin.Context) {


    var opt req.AccountSubclassStatusReq
    defer logError(c)
    err, _ := c.ShouldBindJSON(&opt).(validator.ValidationErrors)
    if err != nil {
        panic(err)
    }
    er := subclass.Svc().DeleteSubclassAccount(c, opt.ID)
    if er != nil {
        panic(errx.DeleteSubclass.CodeError())
    }


	success(c, `ok`)

}

//
// @Summary 子账户绑定权限
// @Description
// @Tags SSO/子账户管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body req.AccountSubclassBindSubRoleReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /sso/subclass/bind_role [POST]
func (a *SsoAccountSubclassApi) BindRole(c *gin.Context) {

    var opt req.AccountSubclassBindSubRoleReq
    defer logError(c)
    err, _ := c.ShouldBindJSON(&opt).(validator.ValidationErrors)
    if err != nil {
        panic(err)
    }
    er := subclass.Svc().BindSubclassAccountRole(c, opt.ID, opt.SubRolePk)
    if er != nil {
        panic(errx.EditSubclass.CodeError())
    }


	success(c, `ok`)

}
