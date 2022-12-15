package queryhelper

import (
	"fmt"
	"github.com/gohouse/gorose/v2"
	"github.com/tealeg/xlsx"
	"github.com/wangcheng0509/gpkg/loghelp"
	"log"
	"time"
)

func Row(req IReqQuery, iorm gorose.IOrm) (map[string]interface{}, error) {
	query := NewReqQuery(req)
	q := iorm.Table(query.Table())

	joins := query.Joins()
	for _, j := range joins {
		args := []interface{}{j.Table, j.On}
		if j.Type == "left" {
			q = q.LeftJoin(args...)
		} else if j.Type == "right" {
			q = q.RightJoin(args...)
		} else if j.Type == "inner" {
			q = q.Join(args...)
		}
	}
	q = applyFilter(q, query.GetFilter())
	q = applyHaving(q, query.GetHaving())

	group := query.Group()
	if len(group) > 0 {
		q = q.Group(group)
	}

	query.Select()
	fields := generateSelectClause(query.Select())
	q = q.Fields(fields).Limit(1).OrderBy(query.Order())

	data, err := q.Get()
	if err != nil {
		return nil, err
	}
	log.Printf(q.LastSql())
	if len(data) == 0 {
		return nil, nil
	}
	row := data[0]
	dataModifier := query.DataModifier()
	if dataModifier != nil {
		row = dataModifier(row)
	}
	return row, nil
}

func Rows(req IReqQuery, iorm gorose.IOrm) ([]map[string]interface{}, error) {
	query := NewReqQuery(req)

	q := iorm.Table(query.Table())

	joins := query.Joins()
	for _, j := range joins {
		args := []interface{}{j.Table, j.On}
		if j.Type == "left" {
			q = q.LeftJoin(args...)
		} else if j.Type == "right" {
			q = q.RightJoin(args...)
		} else if j.Type == "inner" {
			q = q.Join(args...)
		}
	}

	q = applyFilter(q, query.GetFilter())
	q = applyHaving(q, query.GetHaving())

	group := query.Group()
	if len(group) > 0 {
		q = q.Group(group)
	}
	query.Select()
	fields := generateSelectClause(query.Select())
	q = q.Fields(fields).OrderBy(query.Order())
	if query.Limit() > 0 {
		q = q.Limit(query.Limit())
	}

	data, err := q.Get()
	log.Printf(q.LastSql())
	var rows []map[string]interface{}
	dataModifier := query.DataModifier()
	for _, m := range data {
		if dataModifier != nil {
			m = dataModifier(m)
		}
		rows = append(rows, m)
	}
	return rows, err
}

func Page(req IReqQuery, iorm gorose.IOrm) ([]map[string]interface{}, int64, error) {
	query := NewReqQuery(req)

	q := iorm.Table(query.Table())

	joins := query.Joins()
	for _, j := range joins {
		args := []interface{}{j.Table, j.On}
		if j.Type == "left" {
			q = q.LeftJoin(args...)
		} else if j.Type == "right" {
			q = q.RightJoin(args...)
		} else if j.Type == "inner" {
			q = q.Join(args...)
		}
	}

	q = applyFilter(q, query.GetFilter())
	q = applyHaving(q, query.GetHaving())

	countArgs := query.CountArgs()
	total, err := q.Count(countArgs...)
	loghelp.Log(q.LastSql(), "page-getCount", false)
	if err != nil {
		loghelp.Error("Page error", fmt.Sprintf("错误信息:%v", err.Error()), false)
		return nil, 0, err
	}
	group := query.Group()
	if len(group) > 0 {
		q = q.Group(group)
	}
	page := query.Page()
	offset := (page - 1) * query.PageSize()
	query.Select()
	fields := generateSelectClause(query.Select())
	q = q.Fields(fields).Offset(offset).Limit(query.PageSize()).OrderBy(query.Order())

	data, err := q.Get()
	if err != nil {
		loghelp.Error("Page Get error", fmt.Sprintf("错误信息:%v", err.Error()), false)
		return nil, 0, err
	}
	loghelp.Log(q.LastSql(), "page-select", false)
	rows := []map[string]interface{}{}
	dataModifier := query.DataModifier()
	for _, m := range data {
		if dataModifier != nil {
			m = dataModifier(m)
		}
		rows = append(rows, m)
	}
	return rows, total, err
}
func Export(req IReqQuery, iorm gorose.IOrm) (map[string]interface{}, error) {
	data, _, err := Page(req, iorm)
	if err != nil {
		loghelp.Error("Export error", fmt.Sprintf("错误信息:%v", err.Error()), false)
		return nil, err
	}
	q := req.Query()
	c := q.ExportConfigure
	var columns []interface{}
	for _, c := range c.Columns {
		columns = append(columns, c.Title)
	}
	var list = [][]interface{}{}
	for _, row := range data {
		exportRow := []interface{}{}
		for _, c := range q.ExportConfigure.Columns {
			exportRow = append(exportRow, row[c.Column])
		}
		list = append(list, exportRow)
	}
	loc, _ := time.LoadLocation("Asia/Shanghai")
	xlsx.DefaultDateTimeOptions = xlsx.DateTimeOptions{
		Location:        loc,
		ExcelTimeFormat: xlsx.DefaultDateTimeFormat,
	}
	var exportInfo = make(map[string]interface{})
	exportInfo["name"] = c.Name
	exportInfo["title"] = columns
	exportInfo["data"] = list
	exportInfo["suffix"] = q.Suffix
	return exportInfo, nil
}
