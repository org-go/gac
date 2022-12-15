package acs

import (
    "github.com/casbin/casbin/v2"
    "os"
)

var Enforcer *casbin.CachedEnforcer


func init()  {
   // adapter := gormadapter.NewAdapterByDB(repo.ServiceDBA.Mysql)
    path, _ := os.Getwd()
    Enforcer, _ = casbin.NewCachedEnforcer(path+`/apps/call/acs/base.conf`)
    Enforcer.EnableLog(true)

}
