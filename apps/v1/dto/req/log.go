package req

import "payfun.gac.service/apps/v1/dto/common"

//
//  LogSearchReq
//  @Description:
//
type LogSearchReq struct {
    common.PaginationParam
    Module     string `json:"module"`
    Action     string `json:"action"`
    OrgPk      int    `json:"org_pk"`
    AppPk      int    `json:"app_pk"`
    ActionUser string `json:"action_user"`
}
