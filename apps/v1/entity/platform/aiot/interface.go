package aiot

import (
	"context"
)

type (
	IotPlatform interface {
		iotSsoPlatform
		iotMarketPlatform
	}

	iotSsoPlatform interface {
		// Login
		Login(ctx context.Context, req AiotUser) (UserLoginResp, error)
	}

	iotMarketPlatform interface {
		// CreateBizDefinePub 下发
		CreateBizDefinePub(ctx context.Context, req BizDefineActivityPubReq) (DeviceBizDefinePubResp, error)
		// QueryBizDefinePub 查询
		QueryBizDefinePub(ctx context.Context, req SerialNumListReq) (DeviceBizDefinePubGetResp, error)
	}
)
