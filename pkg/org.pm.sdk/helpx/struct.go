package helpx

import (
    "encoding/json"
    "fmt"
    "reflect"
)

/**
 * $(StructToSlice)
 * @Description:
 * @param structure
 * @return []interface{}
 */
func StructToSlice(structure interface{}) []interface{} {
    var v reflect.Value
    v = reflect.ValueOf(structure)
    effect := make([]interface{}, v.NumField())
    for i := range effect {
        effect[i] = fmt.Sprintf("%v", v.Field(i))
    }
    return effect
}

/**
 * $(StructToString)
 * @Description:
 * @param structure
 * @return []string
 */
func StructToString(structure interface{}) []string {
    var v reflect.Value
    v = reflect.ValueOf(structure)
    effect := make([]string, v.NumField())
    for i := range effect {
        effect[i] = fmt.Sprintf("%v", v.Field(i))
    }
    return effect
}

func MapToString(val interface{}) string {

    marshal, _ := json.Marshal(val)
    return string(marshal)

}
