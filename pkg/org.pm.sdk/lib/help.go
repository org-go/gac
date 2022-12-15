package lib

import (
	"bytes"
	"encoding/binary"
	"fmt"
	"math"
	"math/rand"
	"sort"
	"strconv"
	"strings"
	"time"

	"github.com/google/uuid"
	"payfun.gac.service/pkg/org.pm.sdk/sign/secret/luhn"
)

func SliceRemoveDuplicates(slice []string) []string {
	sort.Strings(slice)
	i := 0
	var j int
	for {
		if i >= len(slice)-1 {
			break
		}
		for j = i + 1; j < len(slice) && slice[i] == slice[j]; j++ {
		}
		slice = append(slice[:i+1], slice[j:]...)
		i++
	}
	return slice
}

func Fix64ToRound(next, prev float64) (float64, error) {
	return strconv.ParseFloat(fmt.Sprintf("%.2f", (next-prev)/100), 64)
}

func Unwrap(num int64, retain int) float64 {
	return float64(num) / math.Pow10(retain)
}

func BytesToInt(b []byte) int32 {
	bytesBuffer := bytes.NewBuffer(b)
	var x int32
	_ = binary.Read(bytesBuffer, binary.BigEndian, &x)
	return x
}

func Parse2Float64(num float64) float64 {
	numString := fmt.Sprintf("%0.2f", num)
	r, _ := strconv.ParseFloat(numString, 64)
	return r
}

// 获取随机ID
func GetUniqueId() string {
	unix32bits := uint32(time.Now().UTC().Unix())

	buff := make([]byte, 12)
	rand.Seed(time.Now().UnixNano())
	numRead, err := rand.Read(buff)

	if numRead != len(buff) || err != nil {
		panic(err)
	}
	return fmt.Sprintf("%x%x%x%x%x%x", unix32bits, buff[0:2], buff[2:4], buff[4:6], buff[6:8], buff[8:])
}
func GetUuid() string {
	return strings.ReplaceAll(uuid.NewString(), "-", "")
}

func Suffix() string {
	return fmt.Sprintf("%05v", rand.New(rand.NewSource(time.Now().UnixNano())).Int31n(100000))
}

/**
 * $(CouponCode)
 * @Description:
 * @param factor
 * @return string
 */
func CouponCode(factor string) string {
	if factor == `` {
		factor = time.Now().Format(`010203`)
	}
	time.Sleep(1e6)
	code := fmt.Sprintf(`%s%s%s`, factor, Suffix(), SnowFlake.Sid()[10:])
	num, _ := strconv.Atoi(code)
	return fmt.Sprintf(`%s%d`, code, num%2)

}

/**
 * $(GenCouponCode)
 * @Description:
 * @return string
 */
func GenCouponCode() string {
	now := time.Now()
	return fmt.Sprintf(`%s%s%s`, now.Format(`02`), luhn.GenNum(), now.Format(`01`))
}

/**
 * $(CheckCouponCode)
 * @Description:
 * @param code
 * @return bool
 */
func CheckCouponCode(code string) bool {
	return luhn.CheckNum(code[2 : len(code)-2])
}

/**
 * $(GenOrderNo)
 * @Description:
 * @param sn 16
 * @param tp 3
 * @return string   sn+unix+tp = 16+13+3 = 32
 */
func GenOrderNo(sn string, tp int) string {
	return fmt.Sprintf(`%s%d%d`, sn, time.Now().UnixNano(), tp)
}
