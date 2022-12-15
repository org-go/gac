package middleware

import (
	"github.com/gin-gonic/gin"
)

type (
	IAllow interface {
		Allow() bool
	}
	Point      func(ctx gin.Context, request interface{}) (response interface{}, err error)
	Middleware func(point Point) Point
)

func Chain(outer Middleware, others ...Middleware) Middleware {

	return func(next Point) Point {
		for i := len(others); i >= 0; i-- {
			next = others[i](next)
		}
		return outer(next)
	}

}
