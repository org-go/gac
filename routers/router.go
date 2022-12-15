package routers

import (
	"net/http"

	"payfun.gac.service/apps/v1/api"
	"payfun.gac.service/apps/v1/api/adminApi"
	"payfun.gac.service/apps/v1/api/ssoApi"
	_ "payfun.gac.service/docs"

	"github.com/chenjiandongx/ginprom"
	"github.com/gin-gonic/gin"
	"github.com/prometheus/client_golang/prometheus/promhttp"
	ginSwagger "github.com/swaggo/gin-swagger"
	"github.com/swaggo/gin-swagger/swaggerFiles"
	"github.com/wangcheng0509/gpkg/e"
	"github.com/wangcheng0509/gpkg/exception"
	"github.com/xxjwxc/ginrpc"
	"payfun.gac.service/middleware"
)

// InitRouter initialize routing information
func InitRouter() *gin.Engine {
	router := gin.New()

	router.Use(middleware.Cors())
	router.Use(ginprom.PromMiddleware(nil))
	router.Use(exception.ExceptionHandle())
	router.Use(gin.Recovery())

	auc := router.Group(`/gac`)
	auc.GET("/swagger/*any", ginSwagger.DisablingWrapHandler(swaggerFiles.Handler, ``))
	auc.GET("/metrics", ginprom.PromHandler(promhttp.Handler()))
	auc.GET("/kong/healthchecks", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{"code": e.SUCCESS, "msg": e.GetMsg(e.SUCCESS), "data": "Kong Health Check: 200"})
	})

	{
		auc.Use(middleware.Validator(), middleware.Tracer())
		auc.Use(middleware.Authorization())
		new(version).option(auc).all()
	}

	return router
}

type version struct {
	v   string
	auc *gin.RouterGroup
}

func (self version) option(auc *gin.RouterGroup) *version {
	self.v = `v1`
	self.auc = auc
	return &self
}

func (self version) all() {
	self.admin()
	self.sso()
	self.globe()
}

/**
 * $(center)
 * @Description:
 * @receiver self
 */
func (self version) admin() {
	base := ginrpc.New()
	action := self.auc.Group(self.v)
	base.Register(action, new(adminApi.OrgApi))
	base.Register(action, new(adminApi.AppApi))
	base.Register(action, new(adminApi.AuthApi))
	base.Register(action, new(adminApi.MenuApi))
	base.Register(action, new(adminApi.RoleApi))
	base.Register(action, new(adminApi.PermissionApi))
	base.Register(action, new(adminApi.StaffRoleApi))
	base.Register(action, new(adminApi.StaffPermissionApi))
	base.Register(action, new(adminApi.ServiceRoleApi))
	base.Register(action, new(adminApi.ServicePermissionApi))
	base.Register(action, new(adminApi.AdminAPI))
	base.Register(action, new(adminApi.LogApi))
	base.Register(action, new(adminApi.ProvdAPI))
	base.Register(action, new(adminApi.EnterpriseAPI))

}

/**
 * $(app)
 * @Description:
 * @receiver self
 */
func (self version) sso() {

	base := ginrpc.New()
	action := self.auc.Group(self.v)

	base.Register(action, new(ssoApi.SsoAuthApi))
	base.Register(action, new(ssoApi.SsoAccountSubclassApi))
	base.Register(action, new(ssoApi.SsoPermissionApi))
	base.Register(action, new(ssoApi.SsoMenuApi))
	base.Register(action, new(ssoApi.SsoRoleApi))

	base.Register(action, new(ssoApi.SsoAccountApi))

}

/**
 * $(app)
 * @Description:
 * @receiver self
 */
func (self version) globe() {

	base := ginrpc.New()
	action := self.auc.Group(self.v)
	base.Register(action, new(api.CommonApi))

}
