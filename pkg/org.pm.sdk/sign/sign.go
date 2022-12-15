package sign

import (
	"crypto/aes"
	"crypto/hmac"
	"crypto/rsa"
	"crypto/sha1"
	"crypto/sha256"
	"crypto/x509"
	"encoding/hex"
	"encoding/json"
	"errors"
	"fmt"
	"io/ioutil"
	"net/url"
	"os"
	"strings"

	"golang.org/x/crypto/pkcs12"
	"payfun.gac.service/pkg/org.pm.sdk/setting"

	"github.com/buger/jsonparser"
)

// GetSign 获取签名
func GetSign(req interface{}, key string) string {
	//key = `45ba313a3d030b79fd5d04bdef0fb7e7`
	//key = `22e5fdf7a8dc09e1821f8d87a054d194`
	m := make(map[string]interface{})
	jsonBody, _ := json.Marshal(req)
	json.Unmarshal(jsonBody, &m)
	jsonBody, _ = json.Marshal(m)
	var signStr string
	jsonparser.ObjectEach(jsonBody, func(key []byte, value []byte, dataType jsonparser.ValueType, offset int) error {
		if string(key) == "Sign" {
			return nil
		}
		if len(value) < 1 {
			return nil
		}
		signStr += fmt.Sprintf("%s=%v&", string(key), string(value))
		return nil
	})
	signStr = signStr + "key=" + key
	//fmt.Println("-------", signStr)
	//sign := strings.ToUpper(utils.EncodeMD5(signStr))
	s := ComputeHmacSha256(signStr, key)
	//fmt.Println("=======", s)
	sign := strings.ToUpper(s)
	//fmt.Println("sign", sign)
	return sign
}

// GetAIotSign 获取AIot请求签名
func GetAIotSign(req interface{}) string {
	m := make(map[string]interface{})
	jsonBody, _ := json.Marshal(req)
	json.Unmarshal(jsonBody, &m)
	jsonBody, _ = json.Marshal(m)
	var signStr string
	jsonparser.ObjectEach(jsonBody, func(key []byte, value []byte, dataType jsonparser.ValueType, offset int) error {
		if string(key) == "Sign" {
			return nil
		}
		valueStr := string(value)
		valueStr = strings.ReplaceAll(valueStr, "\\", "")
		valueStr = strings.ReplaceAll(valueStr, "u0026", "&")
		signStr += fmt.Sprintf("%s=%v&", string(key), valueStr)
		return nil
	})
	signStr = signStr[:len(signStr)-1]
	sign := HMACSHA1(setting.AppSecret, signStr)
	return strings.ToUpper(sign)
}

func AesEncryptECB(origDataStr, keyStr string) (hexEncrypted string) {
	origData := []byte(origDataStr)
	key := []byte(keyStr)
	cipher, _ := aes.NewCipher(generateKey(key))
	length := (len(origData) + aes.BlockSize) / aes.BlockSize
	plain := make([]byte, length*aes.BlockSize)
	copy(plain, origData)
	pad := byte(len(plain) - len(origData))
	for i := len(origData); i < len(plain); i++ {
		plain[i] = pad
	}
	encrypted := make([]byte, len(plain))
	// 分组分块加密
	for bs, be := 0, cipher.BlockSize(); bs <= len(origData); bs, be = bs+cipher.BlockSize(), be+cipher.BlockSize() {
		cipher.Encrypt(encrypted[bs:be], plain[bs:be])
	}

	return hex.EncodeToString(encrypted)
}

func generateKey(key []byte) (genKey []byte) {
	genKey = make([]byte, 16)
	copy(genKey, key)
	for i := 16; i < len(key); {
		for j := 0; j < 16 && i < len(key); j, i = j+1, i+1 {
			genKey[j] ^= key[i]
		}
	}
	return genKey
}

// HMACSHA1 HMACSHA1
//  keyStr 密钥
//  value  消息内容
func HMACSHA1(keyStr, value string) string {
	key := []byte(keyStr)
	mac := hmac.New(sha1.New, key)
	mac.Write([]byte(value))
	sha1 := fmt.Sprintf("%x", mac.Sum(nil))
	//进行url编码
	res := url.QueryEscape(sha1)
	return res
}

// ComputeHmacSha256 sha256加密
func ComputeHmacSha256(message string, secret string) string {
	key := []byte(secret)
	h := hmac.New(sha256.New, key)
	h.Write([]byte(message))
	//	fmt.Println(h.Sum(nil))
	sha := hex.EncodeToString(h.Sum(nil))
	return sha
}

func GetPrivateKey(privateKeyName, privatePassword string) (*rsa.PrivateKey, error) {
	f, err := os.Open(privateKeyName)
	if err != nil {
		return nil, err
	}

	bytes, err := ioutil.ReadAll(f)
	if err != nil {
		return nil, err
	}
	// 因为pfx证书公钥和密钥是成对的，所以要先转成pem.Block
	blocks, err := pkcs12.ToPEM(bytes, privatePassword)
	if err != nil {
		return nil, err
	}
	if len(blocks) != 2 {
		return nil, errors.New("解密错误")
	}
	// 拿到第一个block，用x509解析出私钥（当然公钥也是可以的）
	privateKey, err := x509.ParsePKCS1PrivateKey(blocks[0].Bytes)
	if err != nil {
		return nil, err
	}
	return privateKey, nil
}
