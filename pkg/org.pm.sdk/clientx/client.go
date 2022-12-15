package clientx

import (
	"crypto/md5"
	"encoding/hex"
	"fmt"
	"io/ioutil"
	"net/http"
	"strings"

	"github.com/wangcheng0509/gpkg/loghelp"
	"github.com/wangcheng0509/gpkg/utils"
)

/**
 * $(Request)
 * @Description:
 * @param uri
 * @param reqParam
 * @return error
 */
func Request(url, reqParam, body string) (string, error) {

	headers := make(map[string]string)
	headers["X-Sign-Method"] = "md5"
	headers["X-Sign-Value"] = hex.EncodeToString(md5.New().Sum(nil))
	var err error
	var str string
	reqParam = strings.ToUpper(reqParam)
	switch reqParam {
	case "POST":
		err = utils.HTTPPost(&str, url, headers, body)
		fmt.Printf("req-body:%v  resp:%v-----", body, str)

	case "PUT":
		err = hTTPPut(&str, url, headers, body)
	case "GET":
		err = utils.HTTPGet(&str, url, headers)
	}

	if err != nil {
		loghelp.Error(`client request error:`, fmt.Sprintf(`%s`, err.Error()), true)
	}
	return str, err

}

/**
 * $(hTTPPut)
 * @Description:
 * @param out
 * @param url
 * @param header
 * @param param
 * @return error
 */
func hTTPPut(out interface{}, url string, header map[string]string, param string) error {
	client := &http.Client{}
	req, err := http.NewRequest("PUT", url, strings.NewReader(param))
	if err != nil {
		return err
	}
	req.Header.Set("Content-Type", "application/json")
	for k, v := range header {
		req.Header.Set(k, v)
	}
	rsp, err := client.Do(req)
	if err != nil {
		return err
	}
	body, err := ioutil.ReadAll(rsp.Body)
	if err != nil {
		return err
	}
	if err := utils.JSONUnmarshal(string(body), out); err != nil {
		return err
	}
	return nil
}
