package model

import "time"

type AuthMenu struct {
	Pk          int32     `gorm:"pk" json:"pk"`
	OrgPk       int32     `gorm:"org_pk" json:"org_pk"`           // 组织
	AppPk       int32     `gorm:"app_pk" json:"app_pk"`           // 应用
	ParentPk    int32     `gorm:"parent_pk" json:"parent_pk"`     // 上级id
	ParentName  string    `gorm:"parent_name" json:"parent_name"` // 上级名称
	Joins       string    `gorm:"joins" json:"joins"`             // id路径
	Name        string    `gorm:"name" json:"name"`               // 权限名称
	Code        string    `gorm:"code" json:"code"`               // 权限code
	Version     string    `gorm:"version" json:"version"`         // 版本
	Redirect    string    `gorm:"redirect" json:"redirect"`       // 前台路由重定向
	Route       string    `gorm:"route" json:"route"`             // 前台路由
	ViewPath    string    `gorm:"view_path" json:"view_path"`     // 前端模板路径
	ApiRoute    string    `gorm:"api_route" json:"api_route"`     // 接口路由
	Method      string    `gorm:"method" json:"method"`           // 请求方法:get,post,put,patch,options
	Icon        string    `gorm:"icon" json:"icon"`
	Sort        int32     `gorm:"sort" json:"sort"`                 // 排序
	Type        byte      `gorm:"type" json:"type"`                 // 菜单类型： 1：菜单 2：路由 3：按钮
	Show        byte      `gorm:"show" json:"show"`                 // 前端显示状态1：显示 2：隐藏
	Status      byte      `gorm:"status" json:"status"`             // 状态：1:启用 2：停用  3:  删除
	UpdatedTime time.Time `gorm:"updated_time" json:"updated_time"` // 更新时间
	CreatedUser string    `gorm:"created_user" json:"created_user"` // 创建人
	CreatedIp   string    `gorm:"created_ip" json:"created_ip"`     // 创建者Ip
	CreatedTime time.Time `gorm:"created_time" json:"created_time"` // 创建时间
	KeepAlive   byte      `gorm:"keep_alive" json:"keep_alive"`     // 路由缓存： 1：是 2：否
	I18nCode    string    `gorm:"i18n_code" json:"i18n_code"`       // 多语言CODE
}

func (*AuthMenu) TableName() string {
	return "auth_menu"
}
