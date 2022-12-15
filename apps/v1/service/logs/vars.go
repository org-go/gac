package logs

func Svc() iLogSvcInterface {
	return &logService{}
}
