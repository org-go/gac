package middleware

import (
	"context"
	"fmt"
	"net/http"
	"strings"

	"github.com/dgrijalva/jwt-go/request"
	"github.com/gin-gonic/gin"
	"github.com/wangcheng0509/gpkg/app"
	"payfun.gac.service/apps/call/acs"
	"payfun.gac.service/apps/errx"
	"payfun.gac.service/apps/v1/entity/adapter"
	"payfun.gac.service/apps/v1/service/auths"
)

/**
 * $(Authorization)
 * @Description:
	- AUTO_REFRESH_TOKEN
	- refresh jwt(3600/per) after pass check
 * @return gin.HandlerFunc
*/
func Authorization() gin.HandlerFunc {

	return func(c *gin.Context) {

		x := &auths.Claims{}
		if x.Skip(c) == true {
			c.Next()
			return
		}

		token, err := request.AuthorizationHeaderExtractor.ExtractToken(c.Request)
		if err != nil {
			authErr(c, err)
			return
		}

		jwt, err := x.Parse(token)
		switch {
		case err != nil, auths.Svc().TTL(c, jwt) == false:
			authErr(c, errx.JWT)
			return
		case adapter.Super != jwt.Type && jwt.RoleId == 0:
			authErr(c, errx.JWT)
			return
		case adapter.Super == jwt.Type:
		default:
			if passport(c, jwt) == true {
				_ = auths.Svc().Refresh(c, jwt)
			} else {
				authErr(c, errx.Passport)
				return
			}
		}

		value := context.WithValue(c, adapter.X0x0x0, jwt.AuthAdapter)
		c.Request = c.Request.WithContext(value)
		fmt.Printf("%v", c.Request.Context().Value(adapter.X0x0x0))
		c.Next()
	}
}

/**
 * $(passport)
 * @Description:
 * @param c
 * @return bool
 */
func passport(c *gin.Context, claims *auths.Claims) bool {

	if ok := passportSkip(c.Request.URL.Path); ok {
		return ok
	}
	obj := strings.Trim(c.Request.URL.Path, `/`)
	act := c.Request.Method
	sub := fmt.Sprintf(`%s%d`, claims.Type, claims.RoleId)
	return acs.Enforcer.HasPolicy(sub, obj, act)

}

/**
 * $(authErr)
 * @Description:
 * @param c
 * @param err
 */
func authErr(c *gin.Context, err error) {

	reply := app.Response{Code: http.StatusUnauthorized, Message: err.Error()}
	switch err.(type) {
	case *errx.RFC6749Error:
		reply.Message = err.(*errx.RFC6749Error).CodeField
		reply.Code = err.(*errx.RFC6749Error).Code
	}
	c.AbortWithStatusJSON(reply.Code, reply)

}

/**
 * $(passportSkip)
 * @Description:
 * @param path
 * @return bool
 */
func passportSkip(path string) bool {

	switch strings.TrimLeft(path, `/`) {
	case
		`gac/v1/admin/auth/my_permission`,
		`gac/v1/sso/auth/my_permission`,
		`gac/v1/sso/auth/passport`,
		`gac/v1/sso/auth/provider/info`,
		`gac/v1/sso/auth/platform/info`,
		`gac/v1/sso/auth/subclass/info`,
		`gac/v1/sso/auth/platform/update_password`,
		`gac/v1/sso/auth/subclass/rest_password`:
		return true
	}
	return false

}
