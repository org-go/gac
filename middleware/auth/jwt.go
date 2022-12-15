package auth

import (
	"crypto/rsa"
	"errors"

	"github.com/dgrijalva/jwt-go"
)

var (
	errInvalidAuthToken error = errors.New("auth: invalid auth token")
)

type (
	AuthInfo struct {
		jwt.StandardClaims
		Code     string
		Platform uint64
	}
	tokenJWT struct {
		signMethod string
		signKey    *rsa.PrivateKey
		verifyKey  *rsa.PublicKey
	}
)

func (t *tokenJWT) enable()                         {}
func (t *tokenJWT) disable()                        {}
func (t *tokenJWT) invalidateUser(string)           {}
func (t *tokenJWT) genTokenPrefix() (string, error) { return ``, nil }

/**
 * $(info)
 * @Description:
 * @receiver t
 * @param token
 * @param call
 * @return *AuthInfo
 * @return bool
 */
func (t *tokenJWT) info(token string, c ...func()) (*AuthInfo, bool) {
	var claims *AuthInfo
	if parse, err := jwt.ParseWithClaims(token, claims, func(token *jwt.Token) (i interface{}, err error) {
		return t.verifyKey, nil
	}); err != nil {
		if parse.Valid {
			return claims, true
		}
	}
	return nil, false

}

/**
 * $(assign)
 * @Description:
 * @receiver t
 * @param ctx
 * @param username
 * @param platform
 * @return string
 * @return error
 */
func (t *tokenJWT) assign(info AuthInfo) (string, error) {

	return jwt.NewWithClaims(jwt.GetSigningMethod(t.signMethod), info).SignedString(t.signKey)

}

/**
 * $(newAuthTokenJwt)
 * @Description:
 * @param opt
 * @return *tokenJWT
 * @return error
 */
func newAuthTokenJwt(opt map[string]string) (*tokenJWT, error) {
	var jt *tokenJWT
	var err error
	for k, v := range opt {
		switch k {
		case "sign-method":
			jt.signMethod = v
		case "pub-key":
			jt.verifyKey, err = jwt.ParseRSAPublicKeyFromPEM([]byte(v))
		case "prv-key":
			jt.signKey, err = jwt.ParseRSAPrivateKeyFromPEM([]byte(v))
		default:
			return jt, errInvalidAuthToken
		}
	}
	return jt, err
}

func test() {
	jt, _ := newAuthTokenJwt(map[string]string{
		"pub-key":     `public_key`,
		"prv-key":     `private_key`,
		"sign-method": "RS256",
	})
	token, _ := jt.assign(AuthInfo{
		Code:     `dms`,
		Platform: 1,
	})
	jt.info(token)

}
