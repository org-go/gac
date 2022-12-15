package aiot

import (
	"context"
	"encoding/json"
	"errors"
)

import (
	"payfun.gac.service/pkg/org.pm.sdk/clientx"
)

/**
 * $(Login)
 * @Description:
 * @receiver this
 * @param ctx
 * @param req
 * @return AiotUserLoginResp
 * @return error
 */
func (this iot) Login(ctx context.Context, req AiotUser) (UserLoginResp, error) {

	request := SsoLoginWithSignReq{
		SignReq: new(SignReq).Init(this.config.Appid),
	}
	userBytes, _ := json.Marshal(req)
	secretBytes := []rune(this.config.Appsecret)

	request.AccountContent = this.aesEncryptECB(string(userBytes), string(secretBytes[:16]))
	request.SignReq.Sign = this.sign(request, this.config.Appsecret)

	use, _ := json.Marshal(request)
	body, _ := clientx.Request(this.option().Login.Uri, this.option().Login.Request, string(use))
	data := UserLoginResp{}

	err := this.help.decode(body, &data).error(data.StateRsp)
	if err != nil {
		partnerSsoUserError(errors.New(body))
	}

	return data, err
}
