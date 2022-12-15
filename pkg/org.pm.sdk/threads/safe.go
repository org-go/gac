package threads

import (
	"github.com/wangcheng0509/gpkg/loghelp"
)

var SafeMutex iSyncMutex = new(mutex)
var SafeGroup iSyncMutex = new(group)

type iSyncMutex interface {
	Run(func())
	SafeRun(func())
	Wait()
}

func GoSafe(call func()) {
	go RunSafe(call)
}


func RunSafe(call func()) {
	defer Recover()
	call()
}

func Recover(calls ...func()) {
	for _, call := range calls {
		call()
	}
	if err := recover(); err != nil {
		loghelp.Error(`plank`, err.(string), true)
	}
}
