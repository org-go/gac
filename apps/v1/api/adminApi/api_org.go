package adminApi

import (
    "github.com/gin-gonic/gin"
    "github.com/go-playground/validator/v10"
    "payfun.gac.service/apps/v1/dto/req"
    "payfun.gac.service/apps/v1/dto/resp"
    "payfun.gac.service/apps/v1/entity/assembler"
    "payfun.gac.service/apps/v1/service/orgs"
)

type OrgApi struct{}

//
// @Summary 组织列表
// @Description
// @Tags GAC/组织管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body req.OrgSearchReq true "The object content"
// @Success 200 {object}  Response{data=assembler.AdminOrgAssemblers}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/org/page [POST]
func (a *OrgApi) Orgs(c *gin.Context) {

    var opt req.OrgSearchReq
    defer logError(c)
    err, _ := c.ShouldBindJSON(&opt).(validator.ValidationErrors)
    if err != nil {
        panic(err)
    }
    data, page, _ := orgs.Svc().OrgPage(c, opt)

    success(c, PageData{List: data, Pagination: page})

}



//
// @Summary 添加组织
// @Description
// @Tags GAC/组织管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body assembler.AdminOrgAssembler true "The object content"
// @Success 200 {object}  Response{data=assembler.AdminOrgAssembler}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/org/create [POST]
func (a *OrgApi) Create(c *gin.Context) {

    var opt assembler.AdminOrgAssembler
    defer logError(c)
    _ = c.ShouldBindJSON(&opt)

    data,  _ := orgs.Svc().Add(c, opt)

    success(c, data)

}



//
// @Summary 编辑组织
// @Description
// @Tags GAC/组织管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body assembler.AdminOrgAssembler true "The object content"
// @Success 200 {object}  Response{data=assembler.AdminOrgAssembler}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/org/update [POST]
func (a *OrgApi) Update(c *gin.Context) {

    var opt assembler.AdminOrgAssembler
    defer logError(c)
    _ = c.ShouldBindJSON(&opt)

    _ = orgs.Svc().Edit(c, opt)

    success(c, opt)

}



//
// @Summary 删除组织
// @Description
// @Tags GAC/组织管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Param body body req.OrgStatusReq true "The object content"
// @Success 200 {object}  Response
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/org/delete [POST]
func (a *OrgApi) Delete(c *gin.Context) {

    var opt req.OrgStatusReq
    defer logError(c)
    _ = c.ShouldBindJSON(&opt)

    err := orgs.Svc().Delete(c, opt.Pk)
    if err != nil {
        panic(err)
    }
    success(c, nil)

}



//
// @Summary 下拉列表
// @Description
// @Tags GAC/组织管理
// @Accept  json
// @Produce  json
// @Security x-token
// @param authorization header string false "Authorization"
// @Success 200 {object}  Response{data=resp.OptionResps}
// @Failure 400 {object}  Response
// @Failure 500 {object}  Response
// @Router /admin/org/option [GET]
func (a *OrgApi) Option(c *gin.Context) {

    var opt req.OrgSearchReq
    defer logError(c)
    opt.PaginationParam.Pagination = false
    opt.Status = 1
    data, _, _ := orgs.Svc().OrgPage(c, opt)
    var option resp.OptionResps

    success(c, option.Orgs(data))

}
