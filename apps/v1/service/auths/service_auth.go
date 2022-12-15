package auths

import (
	"context"
	"encoding/json"
	"fmt"
	"time"

	"github.com/gin-gonic/gin"
	"golang.org/x/oauth2"
	"payfun.gac.service/apps/v1/entity/adapter"
	"payfun.gac.service/apps/v1/service"
	"payfun.gac.service/pkg/org.pm.sdk/logx"
)



type authService struct {
	edge *service.Edge
}




/**
 * $(GenerateToken)
 * @Description:
 * @receiver this
 * @param ctx
 * @param adapter
 * @return oauth2.Token
 */
func (this authService) GenerateToken(ctx *gin.Context, auth adapter.AuthAdapter) (token oauth2.Token) {

	claims := serializable(func(claims *Claims) { claims.AuthAdapter = auth })
	access, err := claims.sign()
	if err != nil {
		logx.C(ctx).Error(err, func() string { return `gac.auths.token.generate.error` })
		return token
	}

	err = this.Refresh(ctx, claims)
	if err != nil {
		logx.C(ctx).Error(err, func() string { return `gac.auths.token.store.error` })
		return token
	}

	return oauth2.Token{
		Expiry:       time.Now(),
		AccessToken:  access,
		RefreshToken: `AUTO_REFRESH_TOKEN`,
		TokenType:    `Bearer`,
	}

}

/**
 * $(Refresh)
 * @Description:
 * @receiver this
 * @param ctx
 * @param claims
 * @return error
 */
func (this authService) Refresh(ctx context.Context, claims *Claims) error {

	account := this.subclass(claims)
	key := fmt.Sprintf(StrRedisAccountToken, claims.Type, account)
	s, _ := json.Marshal(claims)
	set := this.edge.Redis.Set(ctx, key, string(s), time.Duration(defaultExpiresAt))
	if err := set.Err(); err != nil {
		return err
	}
	return nil

}




/**
 * $(TTL)
 * @Description:
 * @receiver this
 * @param ctx
 * @param claims
 * @return bool
 */
func (this authService) TTL(ctx context.Context, claims *Claims) bool {

	account := this.subclass(claims)
	key := fmt.Sprintf(StrRedisAccountToken, claims.Type, account)
	ttl := this.edge.Redis.TTL(ctx, key)
	result, err := ttl.Result()
	if err != nil || result <= 0 {
		return false
	}
	return true
}

/**
 * $(subclass)
 * @Description:
 * @receiver this
 * @param claims
 * @return string
 */
func (this authService) subclass(claims *Claims) string {

	if claims.SubAccount != `` && claims.Type == adapter.Subclass {
		return claims.SubAccount
	}
	return claims.AccountID

}
