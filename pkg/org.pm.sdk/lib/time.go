package lib

import (
	"math"
	"strconv"
	"strings"
	"time"
)

// CalcDayNum 求日期范围占用的天数
func CalcDayNum(start time.Time, end time.Time) int {
	startTime := start.Unix()
	endTime := end.Unix()
	num := (endTime-startTime)/86400 + 1
	return int(num)
}

func ParseDate(str string) time.Time {
	t, _ := time.Parse("2006-01-02 15:04:05 Z0700 MST", str)
	return t
}

func ParseShortDate(str string) time.Time {
	t, _ := time.Parse("2006-01-02 15:04:05 Z0700 MST", str+" 00:00:00 +0800 CST")
	return t
}

// RangeDate 把日期字符串形式转换为time
// 目前只接受"2006-01-02"格式
// 当start和end为不合法的日期时将返回以当前日期为到day天的一个时间范围
func RangeDate(start string, end string, day int) (time.Time, time.Time) {
	startTime := ParseDate(start + " 00:00:00 +0800 CST")
	endTime := ParseDate(end + " 00:00:00 +0800 CST")
	if startTime.IsZero() && day != 0 {
		startTime, _ = time.Parse("20060102", time.Now().Format("20060102"))
		startTime = startTime.AddDate(0, 0, -(day - 1))
	}
	if endTime.IsZero() && day != 0 {
		endTime, _ = time.Parse("20060102", time.Now().Format("20060102"))
	}
	return startTime, endTime
}

// 获取当前日期
func GetNowDay() (time.Time, error) {
	return time.Parse("20060102", time.Now().Format("20060102"))
}

// ContainDayNum 计算两个日期之间共包含多少天（双开原则）
func ContainDayNum(start time.Time, end time.Time) int {
	num := CalcDayNum(start, end)
	return num
}

// Distance 计算两个日期之间相差几天
func DistanceDayNum(time1 time.Time, time2 time.Time) int {
	num := CalcDayNum(time1, time2)
	return int(math.Abs(float64(num - 1)))
}

func ParseTDateString(date string) string {
	parse, _ := time.Parse(time.RFC3339, date)
	return parse.Format("2006-01-02 15:04:05")
}

// TodayBenginEnd 获取今天的开始时间和结束时间
func TodayBenginEnd() (time.Time, time.Time) {
	dateStr := time.Now().Format("2006-01-02") + " 00:00:00 +0800 CST"
	start := ParseDate(dateStr)
	return start, start.Add(time.Second * 86399)
}

// BenginEnd 获取指定时间的开始时间和结束时间
func BenginEnd(t time.Time) (time.Time, time.Time) {
	start, _ := time.Parse("20060102", t.Format("20060102"))
	return start, start.Add(time.Second * 86399)
}

// GetDateInt 把时间转换成数字的格式20200220
func FormatDateInt(t time.Time) int {
	i, _ := strconv.Atoi(t.Format("20060102"))
	return i
}

func IntToDateStr(t int) string {
	if t == 0 {
		return ""
	}
	str := strconv.Itoa(t)
	tslice := strings.Split(str, "")
	year := tslice[0:4]
	month := tslice[4:6]
	day := tslice[6:8]
	return strings.Join([]string{joinStr(year), joinStr(month), joinStr(day)}, "-")
}

func joinStr(s []string) string {
	return strings.Join(s, "")
}
