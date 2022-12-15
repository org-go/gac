package queryhelper

type Query struct {
	Datasource   string
	Table        string
	Filter       []FilterItem
	Select       []SelectField
	Group        string
	Having       []FilterItem
	Joins        []Join
	Page         int
	PageSize     int
	Limit        int
	Order        string
	DataModifier func(data map[string]interface{}) map[string]interface{}
	CountArgs    []string
	ExportConfigure
}

type Join struct {
	Table string
	Type  string
	On    string
}

type SelectField struct {
	Column string
	Alias  string
}

type FilterItem struct {
	Field    string
	Operator string
	Value    interface{}
}

type ExportConfigure struct {
	Name    string
	Suffix  string
	Columns []ExportColumn
}

type ExportColumn struct {
	Alias  string
	Column string
	Title  string
}

type IQuery interface {
	Datasource() string
	Table() string
	Joins() []Join
	Select() []SelectField
	Group() string
	GetFilter() []FilterItem
	Page() int
	PageSize() int
	SetPageSize(size int)
	Order() string
	DataModifier() func(data map[string]interface{}) map[string]interface{}
}

type IReqQuery interface {
	Query() Query
}
