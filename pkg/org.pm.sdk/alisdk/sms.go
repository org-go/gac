package alisdk

import (
	"fmt"
	"log"
	"strings"
	"sync"

	openapi "github.com/alibabacloud-go/darabonba-openapi/client"
	util "github.com/alibabacloud-go/tea-utils/service"
	"github.com/alibabacloud-go/tea/tea"
	"payfun.gac.service/pkg/org.pm.sdk/setting"

	// 2.x引用下面依赖
	dysmsapi20170525 "github.com/alibabacloud-go/dysmsapi-20170525/v2/client"
)

// SMSClient .
type SMSClient struct {
	SignName     string
	TemplateCode string
	APIClient    *dysmsapi20170525.Client
}

var (
	// SmsClient instanse of client
	SmsClient SMSClient
	once      sync.Once
)

// CreateClient ..
func createClient(accessKeyID, accessKeySecret, endpoint *string) (*dysmsapi20170525.Client, error) {
	config := &openapi.Config{
		AccessKeyId:     accessKeyID,
		AccessKeySecret: accessKeySecret,
		Endpoint:        tea.String(*endpoint),
	}
	smsClient, err := dysmsapi20170525.NewClient(config)
	if err != nil {
		panic(err)
	}
	return smsClient, nil
}

// NewSMSClient 获取短信client
func NewSMSClient() SMSClient {
	return getInternalSMSClient()
}

// GetInternalSMSClient 获取阿里云短信sdk
func getInternalSMSClient() SMSClient {
	once.Do(func() {
		if SmsClient.APIClient != nil {
			return
		}
		SmsClient.APIClient, _ = createClient(
			&setting.AliSDKConfig.AccessKeyID,
			&setting.AliSDKConfig.AccessKeySecret,
			&setting.SMSConfig.Endpoint)

		SmsClient.SignName = setting.SMSConfig.SignName
		SmsClient.TemplateCode = setting.SMSConfig.TemplateCode
	})
	return SmsClient
}

//SendMessage 发送短信
func (s SMSClient) SendMessage(phoneNumbers, code string) error {
	sendSmsRequest := &dysmsapi20170525.SendSmsRequest{
		PhoneNumbers:  tea.String(trimPhoneNum(phoneNumbers)),
		SignName:      tea.String(s.SignName),
		TemplateCode:  tea.String(s.TemplateCode),
		TemplateParam: tea.String(fmt.Sprintf(`{"code":"%s"}`, code)),
	}
	result, err := s.APIClient.SendSmsWithOptions(sendSmsRequest, &util.RuntimeOptions{})
	if err != nil || *result.Body.Code != "OK" {
		log.Printf("alicloud send message err:%+v\n", result.String())
		return err
	}

	return nil
}

func trimPhoneNum(mobile string) string {
	return strings.TrimPrefix(mobile, "+")
}
