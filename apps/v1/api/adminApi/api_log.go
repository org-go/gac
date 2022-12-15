package adminApi

import (
    "github.com/gin-gonic/gin"
    "github.com/go-playground/validator/v10"
    "payfun.gac.service/apps/v1/dto/req"
    "payfun.gac.service/apps/v1/service/logs"

)

type LogApi struct{}

//
// @Summary 日志列表
// @Description
// @Tags GAC/日志管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body req.LogSearchReq true "The object content"
// @Success 200 {object}  Response{data=assembler.AdminLogAssembler}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/log/page [POST]
func (a *LogApi) Logs(c *gin.Context) {

    var opt req.LogSearchReq
    defer logError(c)
    err, _ := c.ShouldBindJSON(&opt).(validator.ValidationErrors)
    if err != nil {
        panic(err)
    }
    data, page, _ := logs.Svc().LogPage(c, opt)

    success(c, PageData{List: data, Pagination: page})

}




//
// @Summary 模块下拉
// @Description
// @Tags GAC/日志管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body req.OrgSearchReq true "The object content"
// @Success 200 {object}  Response{data=assembler.Action}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/log/module_option [GET]
func (a *LogApi) Module(c *gin.Context) {

    var opt req.LogSearchReq
    defer logError(c)
    err, _ := c.ShouldBindJSON(&opt).(validator.ValidationErrors)
    if err != nil {
        panic(err)
    }
    option := logs.Svc().Module(c)

    success(c, option.Option())

}



//
// @Summary 行为下拉
// @Description
// @Tags GAC/日志管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Success 200 {object}  Response{data=assembler.Action}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/log/action_option [GET]
func (a *LogApi) Action(c *gin.Context) {

    var opt req.LogSearchReq
    defer logError(c)
    err, _ := c.ShouldBindJSON(&opt).(validator.ValidationErrors)
    if err != nil {
        panic(err)
    }
    option := logs.Svc().Action(c)

    success(c, option.Option())

}
