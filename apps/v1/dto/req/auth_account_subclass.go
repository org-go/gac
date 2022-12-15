package req

//
//  AuthSubclassResetPasswordReq
//  @Description: 重置密码
//
type AuthSubclassResetPasswordReq struct {
    OldPassword string `json:"old_password" binding:"required,gte=4,lte=20"` // 旧密码
    Password    string `json:"password" binding:"required,gte=4,lte=20"`     // 新密码
}

//
//  AuthSubclassUpdateReq
//  @Description: 编辑
//
type AuthSubclassUpdateReq struct {
    Name   string `json:"name"`   // 账户名称
    Mobile string `json:"mobile"` // 电话
}
