package aiot

import (
	"strconv"
	"time"
)

//
//  SignReq
//  @Description:
//
type SignReq struct {
	AppKey     string `json:"AppKey"`
	Sign       string `json:"Sign"`
	SignMethod string `json:"SignMethod"`
	Timestamp  int64  `json:"Timestamp"`
	Nonce      string `json:"Nonce"`
	Version    string `json:"Version"`
}

func (SignReq) Init(key string) SignReq {
	return SignReq{
		AppKey:     key,
		SignMethod: "HMAC-SHA1",
		Timestamp:  time.Now().Unix(),
		Nonce:      strconv.Itoa(int(time.Now().Unix())),
		Version:    `v1`,
	}
}

//
//  StateRsp
//  @Description:
//
type StateRsp struct {
	Code int    `json:"code"` //
	Msg  string `json:"msg"`
}
