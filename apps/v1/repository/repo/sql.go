package repo

import (
	"context"
	"fmt"
	"log"
	"sync"
	"time"

	_ "github.com/ClickHouse/clickhouse-go"
	"github.com/gohouse/gorose/v2"
	"payfun.gac.service/apps/v1/dto/common"

	"github.com/jinzhu/gorm"
	// "payfun.gms.service/apps/v1/dto/req"
	// "payfun.gms.service/apps/v1/dto/resp"
)

var (
	ServiceDBA       *Dba
	ClickHouseDbConf DataBase
	err              error
)

type (
	DataBase struct {
		Type        string
		User        string
		Password    string
		Host        string
		DBName      string
		TablePrefix string
		PortTcp     string
		PortHttp    string
		Debug       string
	}

	Dba struct {
		Mysql *gorm.DB
	}
)

var clickhouseEngine *gorose.Engin
var clickhouseOnce sync.Once

func init() {
	ServiceDBA = &Dba{}
}

func Registry(database DataBase) {

	switch database.Type {
	case `mysql`:
		ServiceDBA._mysql_conn(database)
	case `clickhouse`:
		ClickHouseDbConf = database
	default:

	}

}

/**
 * _click_house_conn
 * @Description:
 * @receiver d
 * @param database
 * @return *sql.DB
 */
func (d *Dba) GetClickHouseConn() gorose.IOrm {
	clickhouseOnce.Do(func() {
		var err error
		clickhouseEngine, err = gorose.Open(&gorose.Config{
			Driver: "clickhouse",
			Dsn: fmt.Sprintf("tcp://%s:%s/?username=%s&password=%s&database=%s&debug=%s",
				ClickHouseDbConf.Host,
				ClickHouseDbConf.PortTcp,
				ClickHouseDbConf.User,
				ClickHouseDbConf.Password,
				ClickHouseDbConf.DBName,
				ClickHouseDbConf.Debug,
			),
			//Dsn: "tcp://127.0.0.1:19000?database=datacenter&debug=true",
		})
		if err != nil {
			panic(err)
		}

	})

	return clickhouseEngine.NewOrm()

}
func connection(setting DataBase) *gorm.DB {
	db, err := gorm.Open(setting.Type, fmt.Sprintf("%s:%s@tcp(%s)/%s?charset=utf8&parseTime=True&loc=Local",
		setting.User,
		setting.Password,
		setting.Host,
		setting.DBName))
	if err != nil {
		log.Fatalln("models.Setup err:", err)
	}
	db.SingularTable(true)
	db.DB().SetMaxIdleConns(10)
	db.DB().SetMaxOpenConns(100)
	db.DB().SetConnMaxLifetime(time.Hour)
	return db
}

/**
 * _mysql_conn
 * @Description:
 * @receiver d
 * @param database
 * @return *gorm.DB
 */
func (d *Dba) _mysql_conn(database DataBase) *gorm.DB {

	d.Mysql = connection(database).LogMode(false).Debug()
	if err = d.Mysql.DB().Ping(); err != nil {
		_ = d.Mysql.Close()
		d.Mysql = d.Mysql.New()
	}

	d.Mysql.DB().SetConnMaxLifetime(time.Hour)
	if err = d.Mysql.DB().Ping(); err != nil {
		_ = d.Mysql.Close()
		d.Mysql = d.Mysql.New()
	}
	return d.Mysql

}

// PaginationResult 分页查询结果
type PaginationResult struct {
	Total    int  `json:"total"`     // 条数
	Current  uint `json:"current"`   // 当前页
	PageSize uint `json:"page_size"` // 页大小
}

// PaginationParam 分页参数
type PaginationParam struct {
	Pagination bool `json:"pagination" form:"pagination"`                            // 是否使用分页查询
	OnlyCount  bool `json:"-" form:"-"`                                              // 是否仅查询count
	Current    uint `json:"current" form:"current,default=1"`                        // 当前页
	PageSize   uint `json:"page_size" form:"page_size,default=10" binding:"max=100"` // 页大小
}

// WrapPageQuery 包装成带有分页的查询
func WrapPageQuery(db *gorm.DB, pp common.PaginationParam, out interface{}) (*common.PaginationResult, error) {
	if pp.OnlyCount {
		var count int64
		err := db.Count(&count).Error
		if err != nil {
			return nil, err
		}
		return &common.PaginationResult{Total: int(count)}, nil
	} else if !pp.Pagination {
		err := db.Find(out).Error
		return nil, err
	}
	total, err := findPage(db, pp, out)
	if err != nil {
		return nil, err
	}
	return &common.PaginationResult{
		Total:    total,
		Current:  pp.Current,
		PageSize: pp.PageSize,
	}, nil
}

func findPage(db *gorm.DB, pp common.PaginationParam, out interface{}) (int, error) {
	var count int64
	err := db.Count(&count).Error
	if err != nil {
		return 0, err
	} else if count == 0 {
		return int(count), nil
	}
	current, pageSize := int(pp.Current), int(pp.PageSize)
	if current > 0 && pageSize > 0 {
		db = db.Offset((current - 1) * pageSize).Limit(pageSize)
	} else if pageSize > 0 {
		db = db.Limit(pageSize)
	}

	err = db.Find(out).Error
	return int(count), err
}

// TransRepo 事务
type TransRepo struct {
	DB *gorm.DB
}

type (
	transCtx struct{}
)

// NewTrans 新建包含事务的上下文
func NewTrans(ctx context.Context, db *gorm.DB) context.Context {
	return context.WithValue(ctx, transCtx{}, db)
}

// FromTrans 从上下文获取事务
func FromTrans(ctx context.Context) (interface{}, bool) {
	v := ctx.Value(transCtx{})
	return v, v != nil
}

// Exec 事务执行
func (a *TransRepo) Exec(ctx context.Context, fn func(context.Context) error) error {
	if _, ok := FromTrans(ctx); ok {
		return fn(ctx)
	}

	return a.DB.Transaction(func(db *gorm.DB) error {
		return fn(NewTrans(ctx, db))
	})
}

func getDB(ctx context.Context, defDB *gorm.DB) *gorm.DB {
	trans, ok := FromTrans(ctx)
	if ok {
		db, ok := trans.(*gorm.DB)
		if ok {
			return db
		}
	}

	return defDB
}

// Tabler 获取表名
type Tabler interface {
	TableName() string
}

// GetDBWithTable 获取指定struct表名的db
func GetDBWithTable(ctx context.Context, taber Tabler) *gorm.DB {
	return getDB(ctx, ServiceDBA.Mysql).Table(taber.TableName())
}

// NewTransRepo 事务repo
func NewTransRepo() *TransRepo {
	return &TransRepo{
		DB: ServiceDBA.Mysql,
	}
}

var (
	once sync.Once
	// FassDB fass db
	FaasDB *gorm.DB
)

// NewDB new mysql
func NewDB(dsn string) *gorm.DB {
	once.Do(func() {
		if FaasDB != nil && FaasDB.DB().Ping() != nil {
			log.Fatalln("faas db init err:", err)
			return
		}

		var err error
		FaasDB, err = gorm.Open("mysql", dsn)
		if err != nil {
			log.Fatalln("faas db init err:", err)
		}

	})

	return FaasDB
}
