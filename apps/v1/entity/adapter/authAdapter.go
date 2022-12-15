package adapter

import (
	"encoding/json"
	"net/http"
	"strings"

	dapr "github.com/dapr/go-sdk/client"
	"github.com/gin-gonic/gin"
	v1 "payfun.gac.service/apps/v1"
)

type (
	AuthAdapter struct {
		Orgs []string `json:"orgs"`
		Apps []string `json:"apps"`
		Tag  string   `json:"tag"`
		AccountAdapter
	}

	AccountAdapter struct {
		AccountID   string `json:"account_id"`   // 一级账户SSO账户ID
		Account     string `json:"account"`      // 二级账户
		Name        string `json:"name"`         // 二级账户名称
		ProviderId  int    `json:"provider_id"`  // 二级账户：服务商ID
		SubAccount  string `json:"sub_account"`  // 三级账户（子账户：关联类型：I）
		Type        Type   `json:"type"`         // 超级管理员: A， 管理员：B, 企业员工：C, 服务商: D， 外部子账户：I
		AccountType int    `json:"account_type"` // 账户类型: 员工:0x01, 服务商:0x02, 商户:0x03, 消费者:0x04
		RoleId      int32  `json:"role_id"`      // 账户角色
	}
)
type (
	Type        string
	AccountType int
)

const (
	//
	X0x0x0 = `x0x0x0`

	//
	Super    Type = `A`
	Admin    Type = `B`
	Staff    Type = `C`
	Org      Type = `D`
	Subclass Type = `I`
)

//
var GAC = `http://api.t.dev.pay.fun/gac/v1/sso/auth/passport
`

//
//  passport
//  @Description:
//
type passport struct {
	Uri           string `json:"uri"`
	Method        string `json:"method"`
	Authorization string `json:"authorization"`
}

/**
 * $(DaprPassport)
 * @Description:
 * @receiver this
 * @param c
 * @return bool
 */
func (this AccountAdapter) DaprPassport(c *gin.Context) bool {

	port := passport{
		Uri:           c.Request.URL.Path,
		Method:        c.Request.Method,
		Authorization: c.GetHeader(`authorization`),
	}
	data, _ := json.Marshal(&port)
	content := &dapr.DataContent{
		ContentType: "text/plain",
		Data:        data,
	}
	daprd, err := dapr.NewClient()
	if err != nil {
		return false
	}
	defer daprd.Close()

	var lx map[string]interface{}
	withContent, err := v1.Dapr.InvokeMethodWithContent(c, `gac-service`, `gac/v1/sso/auth/passport`, `post`, content)
	if err != nil {
		return false
	}
	_ = json.Unmarshal(withContent, &lx)
	if val, ok := lx[`data`].(bool); ok {
		return val
	}

	return false
}

/**
 * $(DaprPassport)
 * @Description:
 * @receiver this
 * @param c
 * @return bool
 */
func (this AccountAdapter) HttpPassport(c *gin.Context) bool {

	port := passport{
		Uri:           c.Request.URL.Path,
		Method:        c.Request.Method,
		Authorization: c.GetHeader(`authorization`),
	}
	data, _ := json.Marshal(&port)
	client := http.Client{Timeout: 3}
	req, _ := http.NewRequest(`post`, GAC, strings.NewReader(string(data)))
	req.Header = c.Request.Header

	do, err := client.Do(req)
	if err != nil {
		return false
	}

	lx := make(map[string]interface{})
	err = json.NewDecoder(do.Body).Decode(&lx)
	if err != nil {
		return false
	}

	if val, ok := lx[`data`].(bool); ok {
		return val
	}

	return false

}
