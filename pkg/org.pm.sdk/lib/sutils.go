package lib

// DefaultJSONList 默认json数组
const DefaultJSONList = `[]`

// S string
type S string

// Assign 赋值
func (s S) Assign(v string) string {
	if s != "" {
		return string(s)
	} else if v == "" {
		return string(s)
	}
	return v
}
