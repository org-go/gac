package lib

import (
	"fmt"
	"strconv"
)

func FloatAddition(x, y float64) float64 {
	return action2(x + y)
}

func FloatSubtraction(x, y float64) float64 {
	return action2(x - y)
}

func FloatMultiplication(x, y float64) float64 {
	return action2(x * y)
}

func FloatDivision(x, y float64) float64 {
	return action2(x / y)
}

func action2(val float64) float64 {

	value, _ := strconv.ParseFloat(fmt.Sprintf("%.2f", val), 64)
	return value

}
