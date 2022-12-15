package luhn

import (
	"fmt"
	"math/rand"
	"strconv"
	"time"
)


/**
 * $(CheckNum)
 * @Description:
 * @param cardNum
 * @return bool
 */
func CheckNum(cardNum string) bool {
	sum, err := getNumSum(cardNum)
	if err != nil {
		return false
	}
	return sum%10 == 0
}

/**
 * $(getNumSum)
 * @Description:
 * @param cardNum
 * @return int64
 * @return error
 */
func getNumSum(cardNum string) (int64, error) {
	sum := int64(0)
	length := len(cardNum)
	index := length - 1
	for {
		t, err := strconv.ParseInt(string(cardNum[index]), 10, 64)
		if err != nil {
			return 0, err
		}
		if index%2 == 0 {
			t = t * 2
			if t >= 10 {
				fmt.Println(t%10, `---`, t/10)
				t = t%10 + t/10
			}
		}
		sum += t
		if index <= 0 {
			break
		}
		index--
	}
	return sum, nil
}

/**
 * $(GenNum)
 * @Description:
 * @return string
 */
func GenNum() string {

	return GenNumWithArgs(`622609`, 16)
}

/**
 * $(GenNum)
 * @Description:
 * @param startWith
 * @param totalNum
 * @return string
 */
func GenNumWithArgs(startWith string, totalNum int) string {
	result := startWith
	length := len(result)
	rand.New(rand.NewSource(time.Now().UnixNano()))
	for {
		result += fmt.Sprintf("%d", rand.Intn(10))
		if length == totalNum-1 {
			break
		}
		length++
	}
	sum, _ := getNumSum(result + "0")
	t := 10 - sum%10
	if t == 10 {
		t = 0
	}
	result += fmt.Sprintf("%d", t)
	return result
}
