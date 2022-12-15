package aiot

type SsoLoginWithSignReq struct {
	SignReq
	UserLoginReq
}

//
//  UserLoginReq
//  @Description:
//
type UserLoginReq struct {
	AccountContent string `json:"accountContent"` // 通过AES加密后登录信息，详细加密格式看accountContent参数，内容组装成json格式加密
	Type           int    `json:"type"`           // 登录类型：1-账户+密码，2-手机+验证码
}

type AiotUser struct {
	Account  string `json:"account"`  // 用户名
	Password string `json:"password"` // 密码
}

//
//  AiotUserLoginResp
//  @Description:
//
type UserLoginResp struct {
	StateRsp
	UserLoginRespData `json:"data"`
}

type UserLoginRespData struct {
	UserId     int    `json:"userId"`
	Name       string `json:"name"`
	OrgId      int    `json:"orgId"`
	CustomerId int    `json:"customerId"`
}
