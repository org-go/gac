package assembler

import (
    "payfun.gac.service/apps/v1/entity/model"
)

type (
    AdminLogAssembler  model.LogSystem
    AdminLogAssemblers []AdminLogAssembler

    LogAction string
    LogModule string
)

const (
    //  行为
    LogActionInsert LogAction = `insert`
    LogActionUpdate LogAction = `update`
    LogActionDelete LogAction = `delete`
    LogActionLogin  LogAction = `login`
    LogActionOther  LogAction = `other`

    //  模块
    LogModuleOrg             LogModule = `org`
    LogModuleApp             LogModule = `app`
    LogModuleRole            LogModule = `role`
    LogModuleMenu            LogModule = `menu`
    LogModulePermission      LogModule = `permission`
    LogModuleAccount         LogModule = `account`
    LogModuleAccountSubclass LogModule = `subclass`
    LogModuleOther           LogModule = `other`
)

type action struct {
    Code string `json:"code"`
    Name string `json:"name"`
}
type Action interface {
    Option() []action
}

/**
 * $(Option)
 * @Description:
 * @receiver self
 * @return []action
 */
func (self LogAction) Option() []action {
    return []action{
        {Code: string(LogActionInsert), Name: `添加`},
        {Code: string(LogActionUpdate), Name: `编辑`},
        {Code: string(LogActionDelete), Name: `删除`},
        {Code: string(LogActionLogin), Name: `登陆`},
        {Code: string(LogActionOther), Name: `其他`},
    }
}

/**
 * $(Option)
 * @Description:
 * @receiver self
 * @return []action
 */
func (self LogModule) Option() []action {
    return []action{
        {Code: string(LogModuleOrg), Name: `组织`},
        {Code: string(LogModuleApp), Name: `应用`},
        {Code: string(LogModuleRole), Name: `角色`},
        {Code: string(LogModuleMenu), Name: `菜单`},
        {Code: string(LogModulePermission), Name: `权限`},
        {Code: string(LogModuleAccount), Name: `账户`},
        {Code: string(LogModuleAccountSubclass), Name: `子账户`},
        {Code: string(LogModuleOther), Name: `其他`},
    }
}
