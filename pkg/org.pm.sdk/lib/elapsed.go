package lib

import (
	"fmt"
	"github.com/wangcheng0509/gpkg/loghelp"
	"time"
)

var UseHelp *Uses

func init() {
	UseHelp = &Uses{}
}

type Uses struct {
	StartTime time.Time
	EndTime   time.Time
	useTime   string
}

func (u *Uses) Use(endTime ...time.Time) *Uses {
	if len(endTime) > 0 {
		u.EndTime = endTime[0]
	} else {
		u.EndTime = time.Now()
	}
	u.useTime = u.EndTime.Sub(u.StartTime).String()
	return u
}

func (u Uses) CalSec(endTime ...time.Time) float64 {
	if len(endTime) > 0 {
		u.EndTime = endTime[0]
	} else {
		u.EndTime = time.Now()
	}
	return u.EndTime.Sub(u.StartTime).Seconds()
}

func (u Uses) Dump(msg string) {
	fmt.Println(`======`)
	loghelp.Log(msg, fmt.Sprintf(`--- 耗时: %s, START: %s - END: %s`, u.useTime, u.StartTime.Format(`2006-01-02 15:04:05`), u.EndTime.Format(`2006-01-02 15:04:05`)), false)
}
