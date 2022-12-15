package pkg

import (
	"crypto/rand"
	"encoding/base64"
	"encoding/json"
	"fmt"
	"io"
	"reflect"
	"strconv"
	"strings"

	"golang.org/x/crypto/scrypt"

	mrand "math/rand"
)

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

const (
	// Dot .
	Dot = '.'
	// DefaultJSONList json list []
	DefaultJSONList = "[]"
)

// TrimDot TrimDot.
func TrimDot(s string) string {
	if s == "" {
		return s
	} else if s[0] == Dot {
		return s[1:]
	}
	return s
}

// S string
type S string

// JSONArrFormat 字符串格式化为json数组
func (s S) JSONArrFormat(defaltJSON ...string) string {
	ok := json.Valid([]byte(s))
	if !ok {
		if len(defaltJSON) > 0 {
			return defaltJSON[0]
		}

		return DefaultJSONList
	}

	return string(s)
}

func FixedHour(fixed int) int {
	fed := strings.Replace(strconv.Itoa(fixed), `59`, ``, 1)
	fixedEndTime := 0
	if fed != `` {
		fixedEndTime, _ = strconv.Atoi(fed)
	}
	return fixedEndTime

}

/**
 * $(ToInstanceName)
 * @Description:
 * @param v
 * @return string
 */
func ToInstanceName(v interface{}) string {

	t := reflect.TypeOf(v)
	if name := t.Name(); name != "" {
		return t.PkgPath() + "." + name
	}
	e := t.Elem()
	return e.PkgPath() + "." + e.Name()

}

func GenerateBase64RandomString(len int) string {
	b := make([]byte, len)
	if _, err := io.ReadFull(rand.Reader, b); err != nil {
		return ""
	}
	return base64.URLEncoding.WithPadding(base64.NoPadding).EncodeToString(b)
}

// Scrypt 密码hash
func Scrypt(password, salt string) (string, error) {
	dkpassword, err := scrypt.Key([]byte(password), []byte(salt), 32768, 8, 1, 32)
	if err != nil {
		return "", err
	}
	return fmt.Sprintf("%x", dkpassword), nil
}

// SMSCodeGen 短信校验码
func SMSCodeGen(seed int64) string {
	rnd := mrand.New(mrand.NewSource(seed))
	return fmt.Sprintf("%06v", rnd.Int31n(1000000))
}

// MustScrypt 密码hash
func MustScrypt(password, salt string) string {
	dkpassword, err := scrypt.Key([]byte(password), []byte(salt), 32768, 8, 1, 32)
	if err != nil {
		panic(err)
	}
	return fmt.Sprintf("%x", dkpassword)
}
