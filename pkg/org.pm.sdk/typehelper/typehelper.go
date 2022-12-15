package typehelper

import (
	"errors"
	"fmt"
	"reflect"
)

func Int(src interface{}) (int, error) {
	k := reflect.TypeOf(src).Kind().String()
	switch k {
	case "uint64":
		return int(src.(uint64)), nil
	case "uint32":
		return int(src.(uint32)), nil
	case "uint16":
		return int(src.(uint32)), nil
	case "uint8":
		return int(src.(uint8)), nil
	case "int64":
		return int(src.(int64)), nil
	case "int32":
		return int(src.(int32)), nil
	case "int16":
		return int(src.(int16)), nil
	case "int8":
		return int(src.(int8)), nil
	case "int":
		return src.(int), nil
	}
	return 0, errors.New(fmt.Sprintf("%s can not convert to int", k))
}

func Float64(src interface{}) (float64, error) {
	k := reflect.TypeOf(src).Kind().String()
	switch k {
	case "uint64":
		return float64(src.(uint64)), nil
	case "uint32":
		return float64(src.(uint32)), nil
	case "uint16":
		return float64(src.(uint32)), nil
	case "uint8":
		return float64(src.(uint8)), nil
	case "int64":
		return float64(src.(int64)), nil
	case "int32":
		return float64(src.(int32)), nil
	case "int16":
		return float64(src.(int16)), nil
	case "int8":
		return float64(src.(int8)), nil
	case "float32":
		return float64(src.(float32)), nil
	case "float64":
		return src.(float64), nil
	}
	return 0, errors.New(fmt.Sprintf("%s can not convert to float64", k))
}
