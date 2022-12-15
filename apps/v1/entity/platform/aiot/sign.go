package aiot

import (
	"bytes"
	"crypto/aes"
	"crypto/hmac"
	"crypto/md5"
	"crypto/sha1"
	"encoding/hex"
	"encoding/json"
	"fmt"
	"log"
	"net/url"
	"sort"
	"strings"

	"github.com/buger/jsonparser"
)

/**
 * $(sign)
 * @Description:
 * @receiver this
 * @param req
 * @param secret
 * @return string
 */
func (this iot) sign(req interface{}, secret string) string {

	m := make(map[string]interface{})
	jsonBody, _ := json.Marshal(req)
	json.Unmarshal(jsonBody, &m)
	jsonBody, _ = json.Marshal(m)
	fmt.Printf("json Body --> %s\n", jsonBody)
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
	fmt.Println("---", signStr)
	sign := HMACSHA1(secret, signStr)
	return strings.ToUpper(sign)
}

func (this iot) signI(req interface{}, secret string) string {

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
	sign := HMACSHA1(secret, signStr)
	return strings.ToUpper(sign)
}

/**
 * $(aesEncryptECB)
 * @Description:
 * @receiver this
 * @param origDataStr
 * @param keyStr
 * @return hexEncrypted
 */
func (this iot) aesEncryptECB(origDataStr, keyStr string) (hexEncrypted string) {
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

// Sign 签名
func (this iot) signv2(aiotParmas interface{}, signReq SignReq, secret string) string {
	commomMap := make(map[string]interface{})
	commomMap["AppKey"] = signReq.AppKey
	commomMap["Timestamp"] = signReq.Timestamp
	commomMap["Nonce"] = signReq.Nonce
	commomMap["Version"] = "v1"
	commomMap["SignMethod"] = "HMAC-SHA1"

	aiotBytes, err := json.Marshal(aiotParmas)
	if err != nil {
		log.Println(err)
	}

	paramsMap := make(map[string]interface{})
	err = json.Unmarshal(aiotBytes, &paramsMap)
	if err != nil {
		log.Println(err)
	}

	for k, v := range commomMap {
		paramsMap[k] = v
	}

	var keys []string
	for k := range paramsMap {
		keys = append(keys, k)
	}

	sort.Strings(keys)

	var signStr string
	for _, k := range keys {
		if v, ok := paramsMap[k].(string); ok {
			signStr += fmt.Sprintf("%s=%v&", k, v)
		} else if v, ok := paramsMap[k].(int64); ok {
			signStr += fmt.Sprintf("%s=%v&", k, v)
		} else {
			buf := new(bytes.Buffer)
			json.NewEncoder(buf).Encode(paramsMap[k])
			signStr += fmt.Sprintf("%s=%v", k, buf.String())
		}
	}
	signStr = signStr[:len(signStr)-1]
	strings.ReplaceAll(signStr, "\n", "")
	return strings.ToUpper(HMACSHA1(secret, signStr))
}

// HMACSHA1 sha1 加密
func HMACSHA1(keyStr, value string) string {
	key := []byte(keyStr)
	mac := hmac.New(sha1.New, key)
	mac.Write([]byte(value))
	sha1 := fmt.Sprintf("%x", mac.Sum(nil))
	//进行url编码
	res := url.QueryEscape(sha1)
	return res
}

/**
 * $(_encode)
 * @Description:
 * @receiver this
 * @param secretKey
 * @return string
 */
func (this iot) _encode(secretKey string) string {

	h := md5.New()
	h.Write([]byte(secretKey))
	result := hex.EncodeToString(h.Sum(nil))
	fmt.Printf("%s\n", result)
	return result
}
