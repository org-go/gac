package cli

import (
	"fmt"
	dapr "github.com/dapr/go-sdk/client"
	"github.com/gin-gonic/gin"
	"github.com/spf13/cobra"
	"log"
	"net/http"
	v1 "payfun.gac.service/apps/v1"
	"payfun.gac.service/pkg/org.pm.sdk/logx"
	"payfun.gac.service/pkg/org.pm.sdk/setting"
	"payfun.gac.service/routers"
	"time"
)

// rootCmd represents the base command when called without any subcommands
var rootCmd = &cobra.Command{
	Use:   "",
	Short: "cli tool",
	Long:  `cli tool`,
	Run: func(cmd *cobra.Command, args []string) {
		//runGrpc()
		runHttp()
	},
}

/**
 * runHttp
 * @Description:
 */
func runHttp() {

	// dapr
	var err error
	if setting.AppSetting.Env != `local` {
		// wait dapr usable
		time.Sleep(3e9)
		v1.Dapr, err = dapr.NewClient()
		if err != nil {
			logx.G(nil).V(1).Error(err, func() string {return `center.dapr.error`})
		}
		defer v1.Dapr.Close()
	}
	// http
	gin.SetMode(setting.ServerSetting.RunMode)
	routersInit := routers.InitRouter()
	readTimeout := setting.ServerSetting.ReadTimeout
	writeTimeout := setting.ServerSetting.WriteTimeout
	endPoint := fmt.Sprintf(":%d", setting.ServerSetting.HttpPort)
	maxHeaderBytes := 1 << 20
	server := &http.Server{
		Addr:           endPoint,
		Handler:        routersInit,
		ReadTimeout:    readTimeout,
		WriteTimeout:   writeTimeout,
		MaxHeaderBytes: maxHeaderBytes,
	}
	log.Printf("[info] start http server listening %s", endPoint)
	_ = server.ListenAndServe()
}
