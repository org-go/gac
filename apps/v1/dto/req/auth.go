package req

//
//  PermissionAuthReq
//  @Description:
//
type PermissionAuthReq struct {
    Orgs []string `json:"orgs"` // 组织CODE
    Apps []string `json:"apps"` // 应用CODE, GAC子系统默认单选:GAC
}


//
//  SsoPassportAuthReq
//  @Description:
//
type SsoPassportAuthReq struct {
    Uri string `json:"uri" binding:"required"`
    Method string `json:"method" binding:"required"`
}
