package commons

import (
    "encoding/json"
    "github.com/gin-gonic/gin"
    "payfun.gac.service/apps/v1/entity/adapter"
    "payfun.gac.service/pkg/org.pm.sdk/clientx"
    "strings"
)

type commonService struct {
}

/**
 * $(ExportSwagger)
 * @Description:
 * @receiver this
 * @param c
 * @param uri
 * @return error
 */
func (this commonService) ExportSwagger(c *gin.Context, uri string) (adapters  adapter.SwaggerParseAdapters, err error) {


    data, err := clientx.RequestWithRetry(uri, `GET`, ``, nil, 1)
    swagger := adapter.SwaggerAdapter{}
    err = json.Unmarshal([]byte(data), &swagger)
    mod := adapter.SwaggerParseAdapter{}
    for key, val := range swagger.Paths {
        if key != `` {
            mod.ApiRoute = swagger.BasePath + key
            mod.Code = strings.ReplaceAll(strings.TrimLeft(key, `/`), `/`, `_`)
            if val != nil {
                for k, v := range val {
                    if v.Summary != `` {
                        mod.Method = strings.ToUpper(k)
                        mod.Name = strings.Join(v.Tags, `#`) +`/`+ v.Summary
                    } else {
                        continue
                    }
                }
            }
            adapters = append(adapters, mod)
        }
    }

    return adapters, err
}



