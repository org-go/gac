package assembler

import (
	"payfun.gac.service/apps/v1/entity/model"
	"payfun.gac.service/pkg/org.pm.sdk/lib"
	"sort"
)

type MenuAssembler struct {
	model.AuthMenu
	AppCode string `json:"app_code"  ` // 组织Code
	AppName string `json:"app_name"  ` // 组织名称
	OrgName string `json:"org_name" `  // 应用名称
}
type MenuAssemblers []MenuAssembler

type MenuAssemblersWrapper struct {
	Menus  MenuAssemblers
	SortBy func(p, q *MenuAssembler) bool
}

// Len 重写 Len() 方法
func (mw MenuAssemblersWrapper) Len() int {
	return len(mw.Menus)
}

// Swap 重写 Swap() 方法
func (mw MenuAssemblersWrapper) Swap(i, j int) {
	mw.Menus[i], mw.Menus[j] = mw.Menus[j], mw.Menus[i]
}

// Less 重写 Less() 方法
func (mw MenuAssemblersWrapper) Less(i, j int) bool {
	return mw.SortBy(&mw.Menus[i], &mw.Menus[j])
}

// SplitMenusByAppPk 切片分组
func SplitMenusByAppPk(list MenuAssemblers) []MenuAssemblers {
	sort.Sort(MenuAssemblersWrapper{list, func(p, q *MenuAssembler) bool {
		return p.AppPk < q.AppPk // AppPk 递增排序
	}})
	returnData := make([]MenuAssemblers, 0)
	i := 0
	var j int
	for {
		if i >= len(list) {
			break
		}
		for j = i + 1; j < len(list) && list[i].AppPk == list[j].AppPk; j++ {
		}

		returnData = append(returnData, list[i:j])
		i = j
	}
	return returnData
}

// CustomerMenu 定义我们自己的菜单对象
type CustomerMenu struct {
	Pk       int    `json:"pk"`        //id
	ParentPk int    `json:"parent_pk"` //上级菜单id
	Name     string `json:"name"`      //菜单名
	Joins    string `json:"joins"`     //菜单名
	Route    string `json:"route"`     //页面路径
	Icon     string `json:"icon"`      //图标路径
	AppPk    int    `json:"app_pk"  `  // 组织id
	OrgPk    int    `json:"org_pk" `   // 应用id

}
type CustomerMenus []CustomerMenu
type MenuTree []lib.Tree

// GetTitle region 实现ITree 所有接口
func (s CustomerMenu) GetTitle() string {
	return s.Name
}

func (s CustomerMenu) GetPk() int {
	return s.Pk
}

func (s CustomerMenu) GetParentPk() int {
	return s.ParentPk
}

func (s CustomerMenu) GetData() interface{} {
	return s
}

func (s CustomerMenu) IsRoot() bool {
	// 这里通过ParentPk等于0 或者ParentPk等于自身Id表示顶层根节点
	return s.ParentPk == 0

}

// ConvertToINodeArray 将当前数组转换成父类 INode 接口 数组
func (s CustomerMenus) ConvertToINodeArray() (nodes []lib.INode) {
	for _, v := range s {
		nodes = append(nodes, v)
	}
	return
}
