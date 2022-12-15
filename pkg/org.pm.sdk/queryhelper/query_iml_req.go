package queryhelper

type reqQuery struct {
	Query Query
	req   IReqQuery
}

func NewReqQuery(req IReqQuery) reqQuery {
	query := Parse(req)
	return reqQuery{
		req:   req,
		Query: query,
	}
}

func (rq *reqQuery) Datasource() string {
	return rq.Query.Datasource
}

func (rq *reqQuery) Table() string {
	return rq.Query.Table
}

func (rq *reqQuery) Joins() []Join {
	return rq.Query.Joins
}

func (rq *reqQuery) Select() []SelectField {
	return rq.Query.Select
}

func (rq *reqQuery) Group() string {
	return rq.Query.Group
}

func (rq *reqQuery) GetFilter() []FilterItem {
	return rq.Query.Filter
}

func (rq *reqQuery) GetHaving() []FilterItem {
	return rq.Query.Having
}

func (rq *reqQuery) Page() int {
	return rq.Query.Page
}

func (rq *reqQuery) PageSize() int {
	if rq.Query.PageSize <= 0 {
		return 10
	}
	return rq.Query.PageSize
}

func (rq *reqQuery) SetPageSize(size int) {
	rq.Query.PageSize = size
}

func (rq *reqQuery) Order() string {
	return rq.Query.Order
}

func (rq *reqQuery) Limit() int {
	return rq.Query.Limit
}

func (rq *reqQuery) CountArgs() []string {
	return rq.Query.CountArgs
}

func (rq *reqQuery) DataModifier() func(data map[string]interface{}) map[string]interface{} {
	return rq.Query.DataModifier
}
