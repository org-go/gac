package auths

import (
	"strings"
	"time"

	"github.com/dgrijalva/jwt-go"
	"github.com/gin-gonic/gin"
	"payfun.gac.service/apps/v1/entity/adapter"
	"payfun.gac.service/pkg/org.pm.sdk/setting"
)

var (
	//Secret           = setting.JWTSecret
	skips            = []string{`gac/v1/admin/login`, `gac/v1/sso/account/login`}
	defaultExpiresAt = int64(3600e9)
)

type (
	/*
	   option
	*/
	option func(claims *Claims)

	/*
	   Claims
	*/
	Claims struct {
		jwt.StandardClaims
		adapter.AuthAdapter
	}
)

func serializable(options ...option) *Claims {

	opt := &Claims{
		StandardClaims: jwt.StandardClaims{
			Audience:  `GAC`,
			ExpiresAt: defaultExpiresAt,
			IssuedAt:  time.Now().Unix(),
			Issuer:    `PM.INC`,
			Subject:   `SSO`,
		},
	}
	for _, o := range options {
		o(opt)
	}
	return opt
}

/**
 * $(parse)
 * @Description:
 * @receiver this
 * @param token
 * @return *User
 * @return error
 */
func (this *Claims) Parse(token string) (*Claims, error) {

	tokens, err := jwt.ParseWithClaims(token, this, func(token *jwt.Token) (i interface{}, err error) {
		return []byte(setting.JWTSecret), nil
	})
	if claims, ok := tokens.Claims.(*Claims); ok && tokens.Valid {
		Authorized = claims.AuthAdapter
		return claims, nil
	}
	return nil, err

}

/**
 * $(sign)
 * @Description:
 * @receiver this
 * @return string
 * @return error
 */
func (this *Claims) sign() (string, error) {

	withClaims := jwt.NewWithClaims(jwt.SigningMethodHS256, this)
	return withClaims.SignedString([]byte(setting.JWTSecret))

}

/**
 * $(get)
 * @Description:
 * @receiver this
 * @return *adapter.AuthAdapter
 */
func (this *Claims) get() *adapter.AccountAdapter {
	return &this.AccountAdapter
}

/**
 * $(Skip)
 * @Description:
 * @receiver this
 * @param c
 * @return bool
 */
func (this *Claims) Skip(c *gin.Context) bool {

	for _, skip := range skips {
		if strings.Trim(c.Request.URL.Path, `/`) == strings.Trim(skip, `/`) {
			return true
		}
	}
	return false

}
