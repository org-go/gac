package auths

import (
	"context"

	"github.com/gin-gonic/gin"
	"golang.org/x/oauth2"
	"payfun.gac.service/apps/v1/dto/resp"
	"payfun.gac.service/apps/v1/entity/adapter"
)

/*

   v1

   架构设计：

	1. 一套认证体系
	2. 两套权限规则 - 内部规则（基于内部账号产生） + 外部规则（基于外部账号产生）
	3. 四套账号体系 - 内部账号体系（员工+服务商）  + 外部账号体系(商户+消费者)
	4. 多组织
	5. 多应用

	使用原则：

	组织视角： 角色按照公司组织架构灵活使用, 遵循科层管理，扁平授权


	解决问题：
		1. 雇员账号操作简易（一个账户登录所有接入gac的系统），可控；（雇员状态变动一键控制）
		2. 组织结构灵活（层级随意切换），可控（科层管理），高效（扁平授权）。
		3. 多系统接入高效（统筹管理系统），安全（统一passport验证），可控（可控授权）。
		4. 多账号互通（账户基于手机号可同时使用不同系统），融合（账户基于手机号可将外部账户集成统一账户），统筹管理（账户统一可进行统筹管理）
		5. 开放oauth，提高账户转化率（基于外部账户引流转为自身账户），创建账户生态（账户开放加速账户融合），助力品牌塑造（借助账户体系推动塑造企业品牌）


*/

type (

	// iAuthSvcInterface
	iAuthSvcInterface interface {

		//  GenerateToken
		GenerateToken(ctx *gin.Context, auth adapter.AuthAdapter) (token oauth2.Token)

		//  Refresh
		Refresh(ctx context.Context, claims *Claims) error

		//  TTL
		TTL(ctx context.Context,  claims *Claims) bool

		//  Permission
		Permission(ctx *gin.Context, auth adapter.AuthAdapter) (menux resp.MultiMenuResp)
	}

	//  iAccountRoleInterface
	iAccountRoleInterface interface {
		//  Role
		Role(account string) (auth adapter.AuthAdapter)
	}
)
