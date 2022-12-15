package adminApi

import (
    "github.com/gin-gonic/gin"
    "github.com/go-playground/validator/v10"
    "payfun.gac.service/apps/v1/dto/req"
    "payfun.gac.service/apps/v1/dto/resp"
    "payfun.gac.service/apps/v1/entity/assembler"
    "payfun.gac.service/apps/v1/service/apps"

)

type AppApi struct{}



//
// @Summary 下拉列表
// @Description
// @Tags GAC/应用管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body req.AppSearchReq true "The object content"
// @Success 200 {object}  Response{data=resp.OptionResps}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/app/option [POST]
func (a *AppApi) Option(c *gin.Context) {

    var opt req.AppSearchReq
    defer logError(c)
    _ = c.ShouldBindJSON(&opt)

    opt.PaginationParam.Pagination = false
    opt.Status = 1
    data, _, _ := apps.Svc().AppPage(c, opt)
    var option resp.OptionResps

    success(c, option.Apps(data))

}

//
// @Summary 应用列表
// @Description
// @Tags GAC/应用管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body req.AppSearchReq true "The object content"
// @Success 200 {object}  Response{data=assembler.AdminAppAssemblers}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/app/page [POST]
func (a *AppApi) Apps(c *gin.Context) {

    var opt req.AppSearchReq
    defer logError(c)
    err, _ := c.ShouldBindJSON(&opt).(validator.ValidationErrors)
    if err != nil {
        panic(err)
    }
    opt.Pagination = true
    data, page, _ := apps.Svc().AppPage(c, opt)

    success(c, PageData{List: data, Pagination: page})

}



//
// @Summary 添加应用
// @Description
// @Tags GAC/应用管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body assembler.AdminAppAssembler true "The object content"
// @Success 200 {object}  Response{data=assembler.AdminAppAssembler}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/app/create [POST]
func (a *AppApi) Create(c *gin.Context) {

    var opt assembler.AdminAppAssembler
    defer logError(c)
    _ = c.ShouldBindJSON(&opt)

    data,  err := apps.Svc().Add(c, opt)
    if err != nil {
        panic(err)
    }
    success(c, data)

}



//
// @Summary 编辑应用
// @Description
// @Tags GAC/应用管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body assembler.AdminAppAssembler true "The object content"
// @Success 200 {object}  Response{data=assembler.AdminAppAssembler}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/app/update [POST]
func (a *AppApi) Update(c *gin.Context) {

    var opt assembler.AdminAppAssembler
    defer logError(c)
    _ = c.ShouldBindJSON(&opt)

    _ = apps.Svc().Edit(c, opt)

    success(c, opt)

}



//
// @Summary 启用/停用应用
// @Description
// @Tags GAC/应用管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body req.AppStatusReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/app/disable [POST]
func (a *AppApi) Disable(c *gin.Context) {

    var opt req.AppStatusReq
    defer logError(c)
    err, _ := c.ShouldBindJSON(&opt).(validator.ValidationErrors)
    if err != nil {
        panic(err)
    }
    var er error
    switch opt.Status {
    case 1:
        er = apps.Svc().Enable(c, opt.Pk)
    case 2:
        er = apps.Svc().Disable(c, opt.Pk)
    }
    if er != nil {
        panic(er)
    }
    success(c, er)

}



//
// @Summary 删除应用
// @Description
// @Tags GAC/应用管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body req.AppStatusReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/app/delete [POST]
func (a *AppApi) Delete(c *gin.Context) {

    var opt req.AppStatusReq
    defer logError(c)
    err, _ := c.ShouldBindJSON(&opt).(validator.ValidationErrors)
    if err != nil {
        panic(err)
    }

    e := apps.Svc().Delete(c, opt.Pk)
    if e != nil {
        panic(e)
    }
    success(c, nil)

}
