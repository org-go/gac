package aiot

import (
	"context"
	"encoding/json"
	"errors"

	"payfun.gac.service/pkg/org.pm.sdk/clientx"
	"payfun.gac.service/pkg/org.pm.sdk/tools"
)

/**
 * $(CreateBizDefinePub)
 * @Description:  创建
 * @receiver this
 * @param ctx
 * @param req
 * @return DeviceBizDefinePubResp
 * @return error
 */
func (this iot) CreateBizDefinePub(ctx context.Context, req BizDefineActivityPubReq) (DeviceBizDefinePubResp, error) {
	request := PushWithSignReq{
		SignReq:                 new(SignReq).Init(this.config.Appid),
		BizDefineActivityPubReq: req,
	}
	request.SignReq.Sign = this.signv2(request.BizDefineActivityPubReq, request.SignReq, this.config.Appsecret)
	use, _ := json.Marshal(request)

	body, _ := clientx.Request(this.option().MarketPub.Uri, this.option().MarketPub.Request, string(use))
	data := DeviceBizDefinePubResp{}

	err := this.help.decode(body, &data).error(data.StateRsp)
	if err != nil {
		partnerMarketPushError(errors.New(body))
	}

	return data, err
}

/**
 * $(QueryBizDefinePub)
 * @Description:  查询
 * @receiver this
 * @param ctx
 * @param req
 * @return DeviceBizDefinePubGetResp
 * @return error
 */
func (this iot) QueryBizDefinePub(ctx context.Context, req SerialNumListReq) (DeviceBizDefinePubGetResp, error) {
	request := SerialNumListWithSignReq{
		SignReq:          new(SignReq).Init(this.config.Appid),
		SerialNumListReq: req,
	}
	request.SignReq.Sign = this.signv2(request.SerialNumListReq, request.SignReq, this.config.Appsecret)

	use, _ := json.Marshal(request)
	body, _ := clientx.Request(this.option().MarketGet.Uri, this.option().MarketGet.Request, string(use))
	data := DeviceBizDefinePubGetResp{}

	err := this.help.decode(body, &data).error(data.StateRsp)
	if err != nil {
		partnerMarketGetError(errors.New(body))
	}

	return data, err
}

// MakeAiotActivityReq 每200组一次活动下发请求
func MakeAiotActivityReq(sns []string, bizDefine string) []BizDefineActivityPubReq {
	// 200个sn组成一次请求
	groups := tools.Grouping(len(sns), 200)
	bizDefineActivityPubs := make([]BizDefineActivityPubReq, 0, groups)
	for ; groups > 0; groups-- {
		if groups == 1 {
			bizDefineActivityPubs = append(bizDefineActivityPubs,
				BizDefineActivityPubReq{
					SerialNumList: sns[0:],
					BizDefine:     bizDefine,
				})
		} else {
			bizDefineActivityPubs = append(bizDefineActivityPubs,
				BizDefineActivityPubReq{
					SerialNumList: sns[0:200],
					BizDefine:     bizDefine,
				})
			sns = sns[200:]
		}

	}
	return bizDefineActivityPubs
}
