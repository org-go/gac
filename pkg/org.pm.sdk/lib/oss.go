package lib

import (
	"io"

	"github.com/aliyun/aliyun-oss-go-sdk/oss"
	"payfun.gac.service/pkg/org.pm.sdk/setting"
)

// AliOss 文件服务
func AliOss(fileName string, sourceBuffer io.Reader) (string, error) {
	if sourceBuffer == nil {
		return "", nil
	}

	client, err := oss.New(setting.AliOss.Endpoint, setting.AliOss.AccessKeyId, setting.AliOss.AccessKeySecret)
	if err != nil {
		return "", nil
	}

	bucket, err := client.Bucket(setting.AliOss.BucketName)
	if err != nil {
		return "", nil
	}

	err = bucket.PutObject(setting.AliOss.IdeasEnv+fileName, sourceBuffer)
	if err != nil {
		return "", nil
	}
	return setting.AliOss.PrivateServerDomain + "/" + setting.AliOss.IdeasEnv + fileName, nil
}
