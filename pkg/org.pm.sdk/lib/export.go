package lib

import (
	"fmt"
	"os"
	"reflect"

	"github.com/wangcheng0509/gpkg/loghelp"
	"payfun.gac.service/pkg/org.pm.sdk/setting"

	"github.com/tealeg/xlsx"

	"time"
)

var ReportService *Service

func init() {
	ReportService = &Service{}
}

type Options struct {
	Name   string
	Title  []interface{}
	Data   [][]interface{}
	Suffix string
}
type Option func(options *Options)

type Service struct {
	Opts     []Options
	fileName string
	suffix   string
	oss      bool
}

/**
lib.ReportService.New(func(options *lib.Options) {
	options.Name = fmt.Sprintf("广告%s信息", cpx)
	options.Title = []interface{}{"A","B"}
	options.Data = [][]interface{}{{"1","2"},{"A","B"}}
	options.Suffix = string(cpx)
}).
Report().
Oss()

*/
func (repo Service) New(opts ...Option) *Service {
	opt := Options{
		Name:   ``,
		Title:  nil,
		Data:   nil,
		Suffix: `_`,
	}
	for _, o := range opts {
		o(&opt)
		repo.Opts = append(repo.Opts, opt)
	}
	return &repo
}

func (repo *Service) Buffer() (string, error) {
	// return repo.Report().fileName, nil
	return repo.fileName, nil
}

func (repo *Service) Oss() (string, error) {
	// oss, err := os.Open(repo.Report().fileName)
	oss, err := os.Open(repo.fileName)
	if err != nil {
		loghelp.Error("Oss err", fmt.Sprintf("错误信息:%v", err.Error()), false)
		return "", err
	}
	defer oss.Close()
	return AliOss(repo.fileName, oss)

}

/**
 * $(NewMoreSheet)
 * @Description:
 * @receiver repo
 * @param options
 * @return *Service
 */
func (repo Service) NewMoreSheet(options ...Options) *Service {
	repo.Opts = append(repo.Opts, options...)
	return &repo
}

// Report
func (repo Service) Report(fileName string) *Service {
	var sheet *xlsx.Sheet
	var file *xlsx.File
	var row *xlsx.Row
	var err error
	file = nil
	file = xlsx.NewFile()
	for _, option := range repo.Opts {
		sheet, _ = file.AddSheet(option.Name + option.Suffix)
		//_ = sheet.SetColWidth(0, 2, 30)
		row = sheet.Row(0)
		row.WriteSlice(&option.Title, -1)
		for i, data := range option.Data {
			row = sheet.Row(i + 1)
			_ = row.WriteSlice(&data, -1)
		}
	}
	fileName = setting.AppSetting.ExportSavePath + time.Now().Format("20060102030405") + "_" + fileName + ".xlsx"
	if err = file.Save(fileName); err != nil {
		loghelp.Error("Report err", fmt.Sprintf("错误信息:%v", err.Error()), false)
		return &repo
	}
	repo.fileName = fileName
	return &repo
}

func (repo *Service) SetFileName(fileName string) *Service {
	repo.fileName = fileName
	return repo
}

// StructToSlice
func StructToSlice(structure interface{}) []interface{} {
	var v reflect.Value
	v = reflect.ValueOf(structure)
	effect := make([]interface{}, v.NumField())
	for i := range effect {
		effect[i] = fmt.Sprintf("%v", v.Field(i))
	}
	return effect
}
