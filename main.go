package main

import (
	_ "expvar"
	"github.com/wangcheng0509/gpkg/kong"
	"payfun.gac.service/cli"
	"payfun.gac.service/pkg/org.pm.sdk/logging"
	"payfun.gac.service/pkg/org.pm.sdk/setting"
)

func init() {
	setting.Setup()
	logging.Setup()
	if setting.AppSetting.Env != `local` {
		kong.InitKong(setting.KongSetting)
	}
}


// @title GAC授权中心
// @version 2.0
// @description GAC授权中心
// @termsOfService  https://paymedia.yuque.com/os/hb9uhc
// @contact.name org.pm.gac.service
// @contact.url    https://www.apifox.cn/web/main

// @license.name GIN.swagger
// @license.url  https://github.com/swaggo/swag/blob/master/README_zh-CN.md#%E5%A6%82%E4%BD%95%E4%B8%8Egin%E9%9B%86%E6%88%90
// @host api.t.dev.pay.fun
// @BasePath /gac/v1
func main() {

	cli.Execute()
}
