package req

import "payfun.gac.service/apps/v1/dto/common"

//
//  OrgSearchReq
//  @Description:
//
type OrgSearchReq struct {
    common.PaginationParam
    Pk     int32  `json:"pk"`
    Name   string `json:"name"`
    Status byte   `json:"status"`
}


//
//  OrgStatusReq
//  @Description:
//
type OrgStatusReq struct {
    Pk     int32  `json:"pk" binding:"required"`
    Status byte   `json:"status" binding:"oneof=1 2"`
}
