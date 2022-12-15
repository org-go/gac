package adapter

//
//  SwaggerParseAdapter
//  @Description:
//
type (
    SwaggerParseAdapters []SwaggerParseAdapter
    SwaggerParseAdapter  struct {
        Code     string `json:"code"`
        Name     string `json:"name"`
        ApiRoute string `json:"api_route"`
        Method   string `json:"method"`
    }
)

//
//  SwaggerAdapter
//  @Description:
//
type (
    SwaggerAdapter struct {
        BasePath string                     `json:"basePath"`
        Paths    map[string]map[string]SwaggerPathsAdapter `json:"paths"`
    }
    SwaggerPathsAdapter struct {
        Summary string   `json:"summary"`
        Tags    []string `json:"tags"`
    }
)
