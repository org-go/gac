package setting

import (
	"encoding/json"
	"fmt"
	"github.com/go-ini/ini"
	"github.com/wangcheng0509/gpkg/apollo"
	"github.com/wangcheng0509/gpkg/kong"
	"log"
	"os"
	"payfun.gac.service/apps/v1/repository/repo"
	"strconv"
	"strings"
	"time"
)

var (
	cfg                  *ini.File
	AppSetting           = &app{}
	ServerSetting        = &server{}
	LineLoginSetting     = &lineLoginSetting{}
	TwitterSetting       = &twitterSetting{}
	FacebookLoginSetting = &facebookLoginSetting{}
	AliSDKConfig         = &aliSDKConfig{}
	JWTConfig            = &JwtConfig{}
	RedirectSetting      = &redirectSetting{}
)
var (
	mysqlDB     = &repo.DataBase{}
	RedisConf   = &redisConf{}
	KongSetting = kong.Kong{}
	JWTSecret   string
	// JWTWhiteList jwt白名单
	JWTWhiteList string
	// Salt 盐
	Salt string

	UiLocales string
	// CheckinEventPK 签到事件主键
	CheckinEventPK int32
	// SMSConfig 短信配置
	SMSConfig = &smsConfig{}

	AliOss = &AliOssConf{}

	// 语言库
	fassDSN string

	AppSecret string
)

type (
	redisConf struct {
		Host     string
		Password string
	}

	app struct {
		AppName         string
		RuntimeRootPath string
		LogSavePath     string
		LogSaveName     string
		LogFileExt      string
		TimeFormat      string
		ExportSavePath  string
		ExBillSavePath  string
		ImBizSavePath   string
		Env             string
		Tlog            bool
		Zipkin          string
	}

	server struct {
		RunMode      string
		HttpPort     int
		ReadTimeout  time.Duration
		WriteTimeout time.Duration
	}

	lineLoginSetting struct {
		LoginChannelId     string
		LoginChannelSecret string
	}
	twitterSetting struct {
		ClientId     string
		ClientSecret string
		AuthUrl      string
		TokenUrl     string
		MeUrl        string
	}
	facebookLoginSetting struct {
		LoginClientId     string
		LoginClientSecret string
		AuthUrl           string
		TokenUrl          string
		MeUrl             string
		GraphUrl          string
	}
	redirectSetting struct {
		RedirectFrontUrl string
	}
	aliSDKConfig struct {
		AccessKeyID     string
		AccessKeySecret string
		Endpoint        string
	}

	// JwtConfig jwt setting
	JwtConfig struct {
		Issuer         string
		ExpireDuration string
		PublicKey      string
		PrivateKey     string
	}

	smsConfig struct {
		SignName     string
		TemplateCode string
		Endpoint     string
	}

	// AliOssConf ali oss
	AliOssConf struct {
		Endpoint            string
		AccessKeyId         string
		AccessKeySecret     string
		BucketName          string
		PrivateServerDomain string
		Env                 string
		IdeasEnv            string
	}
)

// Setup initialize the configuration instance
func Setup() {
	var err error
	cfg, err = ini.Load("conf/app.ini")
	if err != nil {
		log.Fatalf("setting.Setup, fail to parse 'conf/app.ini': %v", err)
	} else {
		config()
	}
	config_apollo()
	echo()
	repo.Registry(*mysqlDB)
	/*platform.Core = coreSystem.RegistryCorePlatform(&coreSystem.CoreConfig{
	    Site:      coreSetting.Host,
	    Appid:     "",
	    Appsecret: "",
	})*/
	repo.NewDB(fassDSN)

}

// mapTo map section
func mapTo(section string, v interface{}) {
	err := cfg.Section(section).MapTo(v)
	if err != nil {
		log.Fatalf("Cfg.MapTo %s err: %v", section, err)
	}
}

func config() {
	mapTo("app", AppSetting)
	mapTo("server", ServerSetting)
	ServerSetting.ReadTimeout = ServerSetting.ReadTimeout * time.Second
	ServerSetting.WriteTimeout = ServerSetting.WriteTimeout * time.Second
}

func config_apollo() {
	var ApolloSetting = &apollo.Apollo{}
	// enable logx with trace, local:false
	AppSetting.Tlog = true
	AppSetting.Env = os.Getenv("GOENV")
	switch AppSetting.Env {
	case `local`:
		mapTo("apollo-local", ApolloSetting)
		AppSetting.Tlog = false
	case `dev`:
		mapTo("apollo-dev", ApolloSetting)
	case `uat`:
		mapTo("apollo-uat", ApolloSetting)
	case `pro`:
		mapTo("apollo-pro", ApolloSetting)
	}
	fmt.Println(`apollo==`, AppSetting.Env)

	apollo.InitAgollo(*ApolloSetting)
	mapTo("app", AppSetting)
	AppSetting.AppName = apollo.GetSetting("AppName", "application")
	AppSetting.Zipkin = apollo.GetSetting("zipkin.endpoint", "cp.common")
	JWTSecret = apollo.GetSetting("jwt.secret", "cp.common")

	// db configs
	mysqlDB = &repo.DataBase{
		Type:     apollo.GetSetting("dbtype_mysql", "cp.common"),
		User:     apollo.GetSetting("dbuser", "cp.common"),
		Password: apollo.GetSetting("dbpwd", "cp.common"),
		Host:     apollo.GetSetting("dbhost", "cp.common"),
		DBName:   apollo.GetSetting("dbname_datacenter", "cp.common"),
		Debug:    apollo.GetSetting("mysql_debug", "cp.common"),
	}
	// kong configs
	targetWeight, _ := strconv.Atoi(apollo.GetSetting("targetWeight", "cp.kong"))
	sport, _ := strconv.Atoi(apollo.GetSetting("servicePort", "cp.kong"))
	routehost := strings.Split(apollo.GetSetting("routeHost", "cp.kong"), ",")
	routeprotocol := strings.Split(apollo.GetSetting("routeProtocol", "cp.kong"), ",")
	KongSetting = kong.Kong{
		KongHost:        apollo.GetSetting("kongHost", "cp.kong"),
		ServiceName:     apollo.GetSetting("serviceName", "cp.kong"),
		ServiceProtocol: apollo.GetSetting("serviceProtocol", "cp.kong"),
		UpStreamName:    apollo.GetSetting("upStreamName", "cp.kong"),
		TargetPath:      apollo.GetSetting("targetPath", "cp.kong"),
		TargetPort:      apollo.GetSetting("targetPort", "cp.kong"),
		RoutePath:       apollo.GetSetting("routePath", "cp.kong"),
		TargetWeight:    targetWeight,
		ServicePort:     sport,
		RouteProtocol:   routeprotocol,
		RouteHost:       routehost,
	}
	konglog, _ := json.Marshal(KongSetting)
	fmt.Println("kong configs", string(konglog))
	// redis configs
	RedisConf = &redisConf{
		Host:     apollo.GetSetting("redisConn", "cp.common"),
		Password: apollo.GetSetting("redisConnPwd", "cp.common"),
	}

	fassDSN = apollo.GetSetting("FassMysqlConn", "cp.common")
	LineLoginSetting = &lineLoginSetting{
		LoginChannelId:     apollo.GetSetting("LineLoginChannelId", "application"),
		LoginChannelSecret: apollo.GetSetting("LineLoginChannelSecret", "application"),
	}
	TwitterSetting = &twitterSetting{
		ClientId:     apollo.GetSetting("TwitterClientId", "application"),
		ClientSecret: apollo.GetSetting("TwitterClientSecret", "application"),
		AuthUrl:      apollo.GetSetting("TwitterAuthUrl", "application"),
		TokenUrl:     apollo.GetSetting("TwitterTokenUrl", "application"),
		MeUrl:        apollo.GetSetting("TwitterMeUrl", "application"),
	}
	FacebookLoginSetting = &facebookLoginSetting{
		LoginClientId:     apollo.GetSetting("FacebookLoginClientId", "application"),
		LoginClientSecret: apollo.GetSetting("FacebookLoginClientSecret", "application"),
		AuthUrl:           apollo.GetSetting("FacebookAuthUrl", "application"),
		TokenUrl:          apollo.GetSetting("FacebookTokenUrl", "application"),
		MeUrl:             apollo.GetSetting("FacebookMeUrl", "application"),
		GraphUrl:          apollo.GetSetting("FacebookGraphUrl", "application"),
	}

	// jwt config
	JWTConfig = &JwtConfig{
		Issuer:         apollo.GetSetting("Issuer", "application"),
		ExpireDuration: apollo.GetSetting("ExpireDuration", "application"),
		PublicKey:      apollo.GetSetting("PublicKey", "application"),
		PrivateKey:     apollo.GetSetting("PrivateKey", "application"),
	}

	AliSDKConfig = &aliSDKConfig{
		AccessKeyID:     apollo.GetSetting("AliOssAccessKeyId", "application"),
		AccessKeySecret: apollo.GetSetting("AliOssAccessKeySecret", "application"),
		Endpoint:        apollo.GetSetting("AliOssEndPoint", "application"),
	}
	SMSConfig = &smsConfig{
		SignName:     apollo.GetSetting("SMSSignName", "application"),
		TemplateCode: apollo.GetSetting("SMSTemplateCode", "application"),
		Endpoint:     apollo.GetSetting("SMSEndpoint", "application"),
	}

	Salt = apollo.GetSetting("Salt", "application")
	checkinEventPK, err := strconv.Atoi(apollo.GetSetting("CheckinEventPK", "application"))
	if err != nil {
		checkinEventPK = 1
	}
	CheckinEventPK = int32(checkinEventPK)

	JWTWhiteList = apollo.GetSetting("JWTWhiteList", "application")

	RedirectSetting = &redirectSetting{
		RedirectFrontUrl: apollo.GetSetting("RedirectFrontUrl", "application"),
	}

	UiLocales = apollo.GetSetting("UiLocales", "application")


}

func echo() {
	fmt.Println(strings.Repeat(`#`, 100))
	fmt.Println(strings.Repeat(`#`, 44) + ` {GAC STATUS} ` + strings.Repeat(`#`, 42))
	fmt.Println(strings.Repeat(`#`, 100))
	fmt.Println(`[project]  #`, AppSetting.AppName)
	fmt.Println(`[port]     #`, ServerSetting.HttpPort)
	fmt.Println(`[env]      #`, AppSetting.Env)
	fmt.Println(`[mysql]    #`, mysqlDB)
	fmt.Println(`[redis]    #`, RedisConf)
	fmt.Println(`[zipkin]   #`, AppSetting.Zipkin)
	fmt.Println(strings.Repeat(`#`, 100))
	fmt.Printf("\n\n")
}
