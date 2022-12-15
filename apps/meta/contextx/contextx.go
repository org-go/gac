package contextx

import (
	"context"
	"github.com/gin-gonic/gin"
	"payfun.gac.service/apps/v1/entity/adapter"
)

/**
 * $(FromAuthorized)
 * @Description:
 * @param ctx
 * @return auth
 */
func FromAuthorized(ctx context.Context) (auth adapter.AuthAdapter) {

	if v := ctx.Value(adapter.X0x0x0); v != nil {
		auth = v.(adapter.AuthAdapter)
	} else if v := ctx.(*gin.Context).Request.Context().Value(adapter.X0x0x0); v != nil {
		auth = v.(adapter.AuthAdapter)
	}
	return auth

}
