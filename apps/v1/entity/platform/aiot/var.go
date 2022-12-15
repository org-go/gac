package aiot

import (
	"payfun.gac.service/apps/v1/entity"
)

// 平台能力型数据

type (
	iot struct {
		config *IotConfig
		optionIot
		help
	}
	IotConfig struct {
		Appid     string `json:"appid"`
		Appsecret string `json:"appsecret"`
		Site      string `json:"site"`
	}

	optionIot struct {
		Login     entity.Option
		MarketPub entity.Option
		MarketGet entity.Option
	}
	help struct{}
)

const success = 0

func RegistryIotPlatform(config *IotConfig) IotPlatform {
	return &iot{config: config}
}

func (hx iot) option() *optionIot {
	return &optionIot{
		// 登陆
		Login: entity.Option{
			Request: "POST",
			Uri:     hx.config.Site + `/open/user/login`,
		},

		// 下发
		MarketPub: entity.Option{
			Request: "POST",
			Uri:     hx.config.Site + `/open/device/bizDefine/pub`,
		},

		// 查询
		MarketGet: entity.Option{
			Request: "POST",
			Uri:     hx.config.Site + `/open/device/bizDefine/get`,
		},
	}
}
