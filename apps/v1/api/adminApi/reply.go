package adminApi

import (
	"fmt"
	"net/http"
	"strings"

	"payfun.gac.service/apps/errx"
	"payfun.gac.service/apps/v1/dto/common"
	"payfun.gac.service/pkg/org.pm.sdk/logx"

	"github.com/gin-gonic/gin"
	ut "github.com/go-playground/universal-translator"
	"github.com/go-playground/validator/v10"
	"github.com/wangcheng0509/gpkg/app"
)

type Response struct {
	Code    int         `json:"code"`
	Message string      `json:"message"`
	Data    interface{} `json:"data"`
}

var reply = app.Response{}

func logError(c *gin.Context) {
	var e error
	e = errx.Rquest.CodeError()
	if err := recover(); err != nil {
		switch err.(type) {
		case validator.ValidationErrors:
			if errs, ok := err.(validator.ValidationErrors); ok {
				s := fmt.Errorf(`%v`, removeTopStruct(errs.Translate(trans)))
				logx.C(c).V(1).Error(s, func() string { return `defer.recover.error:validator` })
			}
		case errx.RFC6749Error:
			e = fmt.Errorf(`%v`, err.(errx.RFC6749Error))
		default:
			e = fmt.Errorf(`%v`, err)
		}
		failure(c, fmt.Sprintf(`%s`, e))

		return
	}
}

func success(c *gin.Context, data interface{}) {
	reply.SetData(data)
	c.JSON(http.StatusOK, reply)
}

func failure(c *gin.Context, msg string) {

	reply.SetData(nil)
	reply.SetFailed(msg)
	c.JSON(http.StatusOK, reply)
	return
}

// PageData 分页数据
type PageData struct {
	List       interface{}              `json:"list" swaggerignore:"true"` // 列表数据
	Pagination *common.PaginationResult `json:"pagination,omitempty"`      // 分页结果
}

func validatorError(err error) (e error) {

	if errs, ok := err.(validator.ValidationErrors); ok {
		e = fmt.Errorf(`%v`, removeTopStruct(errs.Translate(trans)))
	}
	e = fmt.Errorf(`%v`, err)
	logx.C(nil).Error(err)
	return e
}

func removeTopStruct(fileds map[string]string) map[string]string {
	rsp := map[string]string{}
	for field, err := range fileds {
		rsp[field[strings.Index(field, ".")+1:]] = err
	}
	return rsp
}

var trans ut.Translator
