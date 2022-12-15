package ginhelper

import (
	"github.com/gin-gonic/gin"
	"github.com/wangcheng0509/gpkg/app"
	"net/http"
)

func ResponseOk(c *gin.Context, data interface{}) {
	rsp := app.Response{}
	rsp.SetData(data)
	c.JSON(http.StatusOK, rsp)
}

func ResponseError(c *gin.Context, err error) {
	rsp := app.Response{}
	rsp.SetError(err.Error())
	c.JSON(http.StatusBadRequest, rsp)
}