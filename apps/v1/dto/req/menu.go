package req

import (
    "payfun.gac.service/apps/v1/dto/common"
)

type MenuReq struct {
    common.PaginationParam
    Pk       int    `json:"pk"`        // pk
    ParentPk string `json:"parent_pk"` // 父级Pk
    Pks      []int  `json:"pks"`       // pks
    Type     int    `json:"type"`      // type
    Types    []int  `json:"types"`     // types  type数组形式
    Name     string `json:"name"`      // 菜单名称
    Status   int    `json:"status"`    // 状态：1:启用 2：停用  3:  删除
    Statues  []int  `json:"statues"`   // 状态：1:启用 2：停用  3:  删除 status 数组形式
    OrgPk    int    `json:"org_pk"`    // 组织ID
    AppPk    int    `json:"app_pk"`    // 应用ID
    RolePk   int    `json:"role_pk"`   // 角色ID
    RoleType int    `json:"role_type"` // 角色类型 1:管理员 2：员工 3： 服务商

}

type UpdateMenuReq struct {
    Pk int32 `gorm:"pk" json:"pk" binding:"min=1"` // Pk
    ActionMenuReq
}

type AddMenuReq struct {
    ActionMenuReq
}

type ActionMenuReq struct {
    OrgPk       int32  `gorm:"org_pk" json:"org_pk" `                               // 组织
    AppPk       int32  `gorm:"app_pk" json:"app_pk" `                               // 应用
    ParentPk    int32  `gorm:"parent_pk" json:"parent_pk"`                          // 上级id
    Name        string `gorm:"name" json:"name" binding:"required,gte=1,lte=30"`    // 权限名称
    Code        string `gorm:"code" json:"code"`                                    // 权限code
    ApiRoute    string `gorm:"api_route" json:"api_route"`                          // 接口路由
    Route       string `gorm:"route" json:"route"`                                  // 前台路由
    Redirect    string `gorm:"redirect" json:"redirect"`                            // 前台路由重定向
    ViewPath    string `gorm:"view_path" json:"view_path"`                          // 前端模板路径
    Method      string `gorm:"method" json:"method"`                                // 请求方法:get,post,put,patch,options
    Sort        int32  `gorm:"sort" json:"sort"`                                    // 排序
    Type        byte   `gorm:"type" json:"type" binding:"required,oneof=1 2 3"`     // 菜单类型： 1：菜单 2：路由 3：按钮
    Show        byte   `gorm:"show" json:"show" binding:"required,oneof=1 2"`       // 前端显示状态 1：显示 2：隐藏
    Status      byte   `gorm:"status" json:"status" binding:"required,oneof=1 2 3"` // 状态：1:启用 2：停用  3:  删除
    Icon        string `gorm:"icon" json:"icon"`
    I18nCode    string `gorm:"i18n_code" json:"i18n_code"`       // 多语言CODE
    KeepAlive   byte   `gorm:"keep_alive" json:"keep_alive"`     // 路由缓存： 1：是 2：否
    CreatedUser string `gorm:"created_user" json:"created_user"` // 创建人
    CreatedIp   string `gorm:"created_ip" json:"created_ip"`     // 创建者Ip
}

type UpdateMenuStatusReq struct {
    Pk          int32  `gorm:"pk" json:"pk" binding:"min=1"`                        // Pk
    Pks         []int  `json:"pks"`                                                 // pks
    Status      byte   `gorm:"status" json:"status" binding:"required,oneof=1 2 3"` // 状态：1:启用 2：停用  3:  删除
    CreatedUser string `gorm:"created_user" json:"created_user"`                    // 创建人
    CreatedIp   string `gorm:"created_ip" json:"created_ip"`                        // 创建者Ip
}

type SubclassMenuReq struct {
    common.PaginationParam
    Pk       int    `json:"pk"`        // pk
    ParentPk string `json:"parent_pk"` // 父级Pk
    Pks      []int  `json:"pks"`       // pks
    Type     int    `json:"type" `     // 角色类型：1:服务商类型 2：服务商子账号类型
    Name     string `json:"name"`      // 菜单名称
    Status   int    `json:"status"`    // 状态：1:启用 2：停用  3:  删除
    Statues  []int  `json:"statues"`   // 状态：1:启用 2：停用  3:  删除
    RolePk   int    `json:"role_pk"`   // 角色ID

}
