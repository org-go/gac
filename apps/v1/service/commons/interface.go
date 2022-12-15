package commons

import (
	"github.com/gin-gonic/gin"
	"payfun.gac.service/apps/v1/entity/adapter"
)

type (

	// iCommonService
	iCommonService interface {

		//  ExportSwagger
		ExportSwagger(c *gin.Context, uri string) (adapters  adapter.SwaggerParseAdapters, err error)

	}

)
