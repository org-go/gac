package tools

import (
	"bytes"
	"crypto/md5"
	"encoding/hex"
	"errors"

	"fmt"
	"math"
	"math/rand"
	"net"
	"reflect"
	"strconv"
	"strings"
	"time"
)

func BuildBatchUpdateSQLArray(tableName string, dataList interface{}) []string {

	fieldValue := reflect.ValueOf(dataList)
	fieldType := reflect.TypeOf(dataList).Elem().Elem()
	sliceLength := fieldValue.Len()
	fieldNum := fieldType.NumField()
	// 检验结构体标签是否为空和重复
	verifyTagDuplicate := make(map[string]string)
	for i := 0; i < fieldNum; i++ {
		fieldTag := fieldType.Field(i).Tag.Get("gorm")

		fieldName := GetFieldName(fieldTag)
		if len(strings.TrimSpace(fieldName)) == 0 {
			return nil
		}
		/*if !strings.HasPrefix(fieldName, "id;") {
			return nil
		}*/

		_, ok := verifyTagDuplicate[fieldName]
		if !ok {
			verifyTagDuplicate[fieldName] = fieldName
		} else {
			return nil
		}

	}

	var IDList []string
	updateMap := make(map[string][]string)
	for i := 0; i < sliceLength; i++ {
		// 得到某一个具体的结构体的
		structValue := fieldValue.Index(i).Elem()
		for j := 0; j < fieldNum; j++ {
			elem := structValue.Field(j)

			var temp string
			switch elem.Kind() {
			case reflect.Int64:
				temp = strconv.FormatInt(elem.Int(), 10)
			case reflect.String:
				if strings.Contains(elem.String(), "'") {
					temp = fmt.Sprintf("'%v'", strings.ReplaceAll(elem.String(), "'", "\\'"))
				} else {
					temp = fmt.Sprintf("'%v'", elem.String())
				}
			case reflect.Float64:
				temp = strconv.FormatFloat(elem.Float(), 'f', -1, 64)
			case reflect.Bool:
				temp = strconv.FormatBool(elem.Bool())
			default:
				return nil
			}
			gormTag := fieldType.Field(j).Tag.Get("gorm")
			fieldTag := GetFieldName(gormTag)
			if strings.HasPrefix(fieldTag, "id;") {
				id, err := strconv.ParseInt(temp, 10, 64)
				if err != nil {
					return nil
				}
				// id 的合法性校验
				if id < 1 {
					return nil
				}
				IDList = append(IDList, temp)
				continue
			}

			valueList := append(updateMap[fieldTag], temp)
			updateMap[fieldTag] = valueList
		}
	}
	length := len(IDList)
	size := 200
	SQLQuantity := getSQLQuantity(length, size)
	var SQLArray []string
	k := 0
	for i := 0; i < SQLQuantity; i++ {
		count := 0
		var record bytes.Buffer
		record.WriteString("UPDATE " + tableName + " SET ")
		for fieldName, fieldValueList := range updateMap {
			record.WriteString(fieldName)
			record.WriteString(" = CASE " + "id")
			for j := k; j < len(IDList) && j < len(fieldValueList) && j < size+k; j++ {
				record.WriteString(" WHEN " + IDList[j] + " THEN " + fieldValueList[j])
			}
			count++
			if count != fieldNum-1 {
				record.WriteString(" END, ")
			}
		}
		record.WriteString(" END WHERE ")
		record.WriteString("id" + " IN (")
		min := size + k
		if len(IDList) < min {
			min = len(IDList)
		}
		record.WriteString(strings.Join(IDList[k:min], ","))
		record.WriteString(");")

		k += size
		SQLArray = append(SQLArray, record.String())
	}
	return SQLArray
}

func getSQLQuantity(length, size int) int {
	SQLQuantity := int(math.Ceil(float64(length) / float64(size)))
	return SQLQuantity
}

func GetFieldName(fieldTag string) string {
	fieldTagArr := strings.Split(fieldTag, ":")
	if len(fieldTagArr) == 0 {
		return ""
	}

	fieldName := fieldTagArr[len(fieldTagArr)-1]

	return fieldName
}

var src = rand.NewSource(time.Now().UnixNano())

const (
	letterIdxBits = 6                    // 6 bits to represent a letter index
	letterIdxMask = 1<<letterIdxBits - 1 // All 1-bits, as many as letterIdxBits
	letterIdxMax  = 63 / letterIdxBits   // # of letter indices fitting in 63 bits
)
const letterBytes = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

func RandString(n int) string {
	b := make([]byte, n)
	// A src.Int63() generates 63 random bits, enough for letterIdxMax characters!
	for i, cache, remain := n-1, src.Int63(), letterIdxMax; i >= 0; {
		if remain == 0 {
			cache, remain = src.Int63(), letterIdxMax
		}
		if idx := int(cache & letterIdxMask); idx < len(letterBytes) {
			b[i] = letterBytes[idx]
			i--
		}
		cache >>= letterIdxBits
		remain--
	}
	return string(b)
}

// GetExternalIP 获取IP
func GetExternalIP() (net.IP, error) {
	ifaces, err := net.Interfaces()
	if err != nil {
		return nil, err
	}
	for _, iface := range ifaces {
		if iface.Flags&net.FlagUp == 0 {
			continue // interface down
		}
		if iface.Flags&net.FlagLoopback != 0 {
			continue // loopback interface
		}
		addrs, err := iface.Addrs()
		if err != nil {
			return nil, err
		}
		for _, addr := range addrs {
			ip := getIPFromAddr(addr)
			if ip == nil {
				continue
			}
			return ip, nil
		}
	}
	return nil, errors.New("connected to the network?")
}

func getIPFromAddr(addr net.Addr) net.IP {
	var ip net.IP
	switch v := addr.(type) {
	case *net.IPNet:
		ip = v.IP
	case *net.IPAddr:
		ip = v.IP
	}
	if ip == nil || ip.IsLoopback() {
		return nil
	}
	ip = ip.To4()
	if ip == nil {
		return nil // not an ipv4 address
	}

	return ip
}

// GetNowDate 获取当前字符串日期
func GetNowDate() string {
	return time.Now().Format("2006-01-02")
}

//生成随机字符串
func GetRandomString(length int) string {
	str := "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	bytes := []byte(str)
	result := []byte{}
	r := rand.New(rand.NewSource(time.Now().UnixNano()))
	for i := 0; i < length; i++ {
		result = append(result, bytes[r.Intn(len(bytes))])
	}
	return string(result)
}

// 生成32位MD5
func MD5(text string) string {
	ctx := md5.New()
	ctx.Write([]byte(text))
	return hex.EncodeToString(ctx.Sum(nil))
}
