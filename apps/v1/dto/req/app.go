package req

import "payfun.gac.service/apps/v1/dto/common"

//
//  AppSearchReq
//  @Description:
//
type AppSearchReq struct {
    Pk     int32  `json:"pk"`
    Orgs   []int  `json:"orgs"`
    Name   string `json:"name"`
    Status byte   `json:"status"`
    common.PaginationParam
}

//
//  AppStatusReq
//  @Description:
//
type AppStatusReq struct {
    Pk     int32 `json:"pk" binding:"required"`
    Status int   `json:"status" binding:"required"`
}
