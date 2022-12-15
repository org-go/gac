package queryhelper

import (
	"fmt"
	"github.com/gohouse/gorose/v2"
	"reflect"
	"strconv"
	"strings"
	"time"
)

var commands map[string]func(q *Query, params []string, v reflect.Value)

func init() {
	commands = make(map[string]func(q *Query, params []string, v reflect.Value))
	commands["filter"] = commandFilter
	commands["page"] = commandPage
	commands["pagesize"] = commandPageSize
	commands["timeFilter"] = commandTimeFilter
	commands["having"] = commandHaving
}

func Parse(req IReqQuery) Query {
	q := req.Query()
	t := reflect.TypeOf(req).Elem()
	va := reflect.ValueOf(req).Elem()
	var fields []string
	for i := 0; i < t.NumField(); i++ {
		fieldType := t.Field(i)
		fields = append(fields, fieldType.Name)
		tagColumn := fieldType.Tag.Get("query")
		if len(tagColumn) > 0 {
			arr := strings.Split(tagColumn, ";")
			for _, f := range arr {
				var cmd string
				leftBracket := strings.Index(f, "(")
				rightBracket := strings.Index(f, ")")
				var params []string
				if leftBracket != -1 && rightBracket != -1 {
					cmd = f[:leftBracket]
					params = strings.Split(f[leftBracket+1:rightBracket], ",")
					for i, _ := range params {
						params[i] = strings.TrimSpace(params[i])
					}
				} else {
					cmd = f
				}
				if _, ok := commands[cmd]; ok {
					commands[cmd](&q, params, va.Field(i))
				}
			}
		}
	}
	return q
}

func commandFilter(q *Query, params []string, v reflect.Value) {
	var column string
	var operator string
	if len(params) >= 1 {
		column = params[0]
	}
	if len(params) >= 2 {
		operator = params[1]
	}
	if len(params) >= 3 {
		if isEmpty(v) {
			return
		}
	}
	q.Filter = append(q.Filter, FilterItem{
		Field:    column,
		Operator: operator,
		Value:    v.Interface(),
	})
}

func commandTimeFilter(q *Query, params []string, v reflect.Value) {
	var column string
	var operator string
	value := v.Interface()

	if len(params) >= 1 {
		column = params[0]
	}
	if len(params) >= 2 {
		operator = params[1]
	}
	if len(params) >= 3 {
		if isEmpty(v) {
			return
		}
	}
	if len(params) >= 4 {
		if params[3] == "end" {
			dateStr := v.String()
			date, err := time.Parse("2006-01-02", dateStr)
			if err != nil {
				return
			}
			value = date.Add(86399 * time.Second).Format("2006-01-02 15:04:05")
		}
		if params[3] == "start" {
			dateStr := v.String()
			date, err := time.Parse("2006-01-02", dateStr)
			if err != nil {
				return
			}
			value = date.Format("2006-01-02 15:04:05")
		}
	}

	q.Filter = append(q.Filter, FilterItem{
		Field:    column,
		Operator: operator,
		Value:    value,
	})
}

func commandHaving(q *Query, params []string, v reflect.Value) {
	var column string
	var operator string

	if len(params) >= 1 {
		column = params[0]
	}
	if len(params) >= 2 {
		operator = params[1]
	}
	if len(params) >= 3 {
		if isEmpty(v) {
			return
		}
	}
	q.Having = append(q.Having, FilterItem{
		Field:    column,
		Operator: operator,
		Value:    v.Interface(),
	})
}

func commandPage(q *Query, params []string, v reflect.Value) {
	page := v.Int()

	if page > 0 {
		q.Page = int(page)
		return
	}
	q.Page = 1
}

func commandLimit(q *Query, params []string, v interface{}, t reflect.Type) {
	limit := v.(int)

	if limit > 0 {
		q.Limit = limit
		return
	}
	q.Limit = 1
}
func commandPageSize(q *Query, params []string, v reflect.Value) {
	pageSize := int(v.Int())

	if pageSize > 0 {
		q.PageSize = pageSize
		return
	}

	if len(params) > 0 {
		pageSize, _ = strconv.Atoi(params[0])
	}
	q.PageSize = pageSize
}

func applyFilter(query gorose.IOrm, filters []FilterItem) gorose.IOrm {
	for _, f := range filters {
		operator := ""
		switch f.Operator {
		case "eq":
			operator = "="
		case "neq":
			operator = "!="
		case "lte":
			operator = "<="
		case "gte":
			operator = ">="
		case "not in":
			operator = "not in"
		case "in":
			operator = "in"
		case "gt":
			operator = ">"
		case "lt":
			operator = "<"
		case "is null":
			operator = "is null"
		case "is not null":
			operator = "is not null"
		}
		if operator == "is null" {
			query = query.WhereNull(f.Field)
		} else if operator == "is not null" {
			query = query.WhereNotNull(f.Field)
		} else if len(operator) > 0 {
			query = query.Where(f.Field, operator, f.Value)
		}
	}
	return query
}

func applyHaving(query gorose.IOrm, filters []FilterItem) gorose.IOrm {
	having := []string{}
	for _, f := range filters {
		operator := ""
		switch f.Operator {
		case "eq":
			operator = "="
		case "neq":
			operator = "!="
		case "lte":
			operator = "<="
		case "gte":
			operator = ">="
		}
		if len(operator) > 0 {
			having = append(having, fmt.Sprintf("%s%s"+generateFmtPlaceholder(f.Value), f.Field, operator, f.Value))
		}
	}
	havingCluase := strings.Join(having, " and ")
	return query.Having(havingCluase)
}

func generateSelectClause(fields []SelectField) string {
	var columns []string
	for _, f := range fields {
		if len(f.Alias) > 0 {
			columns = append(columns, fmt.Sprintf("%s AS `%s`", f.Column, f.Alias))
		} else {
			columns = append(columns, fmt.Sprintf("%s", f.Column))
		}
	}
	if len(columns) > 0 {
		return strings.Join(columns, ",")
	}
	return ""
}

func isEmpty(v reflect.Value) bool {
	switch v.Kind() {
	case reflect.Int:
		return v.Int() == 0
	case reflect.String:
		return v.String() == ""
	case reflect.Slice:
		return v.Len() == 0
	}
	return false
}

func generateFmtPlaceholder(v interface{}) string {
	ref := reflect.TypeOf(v)
	switch ref.Kind() {
	case reflect.Int, reflect.Uint, reflect.Int8, reflect.Uint8, reflect.Int16, reflect.Uint16, reflect.Int32, reflect.Uint32, reflect.Int64, reflect.Uint64:
		return "%d"
	case reflect.Float64, reflect.Float32:
		return "%f"
	}
	return "'%s'"
}
