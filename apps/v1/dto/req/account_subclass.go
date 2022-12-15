package req

import (
    "payfun.gac.service/apps/v1/dto/common"
)

//
//  AccountSubclassSearchReq
//  @Description: 查询
//
type AccountSubclassSearchReq struct {
    common.PaginationParam
    AccountID string `json:"account_id"`
    ID        string `json:"id"`
    Status    byte   `json:"status"`
}

//
//  AccountSubclassCreateReq
//  @Description: 添加
//
type AccountSubclassCreateReq struct {
    Name     string `json:"name"`                                     // 名称
    Account  string `json:"account" binding:"required,gte=4,lte=20"`  // 账户
    Password string `json:"password" binding:"required,gte=4,lte=20"` // 登陆密码

}

//
//  AccountSubclassBindSubRoleReq
//  @Description: 绑定角色
//
type AccountSubclassBindSubRoleReq struct {
    SubRolePk int32  `json:"sub_role_pk" binding:"required"` // 子账号角色id
    ID        string `json:"id" binding:"required"`          // 子账户
}

//
//  AccountSubclassStatusReq
//  @Description:
//
type AccountSubclassStatusReq struct {
    ID     string `json:"id" binding:"required"`     // 账户ID
    Status int    `json:"status" binding:"required"` // 状态:1:启用 2:禁用
}
