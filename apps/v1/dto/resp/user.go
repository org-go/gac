package resp

// UserInfo用户信息
type UserInfo struct {
	Name       string `json:"name" `
	Type       string `json:"type"`
	UserId     int    `json:"user_id" `
	OrgId      int    `json:"org_id" `
	CustomerId int    `json:"customer_id" `
	Token      string `json:"token" `
	Role       string `json:"role"`
	Lang       string `json:"lang"`
}
