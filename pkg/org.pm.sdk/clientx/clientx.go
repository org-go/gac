package clientx

import (
	"bytes"
	"fmt"
	"io"
	"io/ioutil"
	"net/http"
	"strings"
)



/**
 * $(RequestWithRetry)
 * @Description:
 * @param url
 * @param method
 * @param request
 * @param header
 * @param retryNum
 * @return data
 * @return err
 */
func RequestWithRetry(url, method, request string, header  map[string]string, retryNum int) (data string, err error) {

	//var err error
	client := &http.Client{}
	method = strings.ToUpper(method)
	switch method {
	case `GET`, `POST`, `PUT`:
		method = method
	default:
		return ``, err
	}
	req, err := http.NewRequest(method, url, strings.NewReader(request))
	req.Header.Set("Content-Type", "application/json")
	for k, v := range header {
		req.Header.Set(k, v)
	}
	if retryNum == 0 {
		retryNum = 1
	}
	bt, err := retryDo(req, client, retryNum)
	if err != nil {
		return ``, err
	}
	return string(bt), err

}

/**
 * $(retryDo)
 * @Description:
 * @param req
 * @param client
 * @param retryNum
 * @return bt
 * @return err
 */
func retryDo(req *http.Request, client *http.Client, retryNum int) (bt []byte, err error) {
	var resp *http.Response

	var originalBody  []byte
	if req != nil && req.Body != nil {
		originalBody, err = copyBody(req.Body)
		if err != nil {
			return bt, err
		} else {
			resetBody(req, originalBody)
		}
	}

	for i := 1; i <= retryNum; i++ {
		client.Timeout = 10e9
		resp, err = client.Do(req)
		if err != nil {
			fmt.Printf("Error sending the first time: %v\n", err)
			continue
		} else if resp.StatusCode != http.StatusOK {
			continue
		}
		resetBody(req, nil)
		break
	}
	if resp == nil {
		return bt, fmt.Errorf(`iss.core.timeout`)
	}
	bt, err = ioutil.ReadAll(resp.Body)
	if err != nil {
		return bt, nil
	}
	_ = resp.Body.Close()
	return bt, req.Context().Err()

}
/**
 * $(copyBody)
 * @Description:
 * @param src
 * @return []byte
 * @return error
 */
func copyBody(src io.ReadCloser) ([]byte, error) {
	b, err := ioutil.ReadAll(src)
	if err != nil {
		return nil, err
	}
	_ = src.Close()
	return b, nil
}



/**
 * $(resetBody)
 * @Description:
 * @param request
 * @param originalBody
 */
func resetBody(request *http.Request, originalBody []byte) {

	bf := bytes.NewBuffer(originalBody)
	request.Body = io.NopCloser(bf)

	request.GetBody = func() (io.ReadCloser, error) {
		return io.NopCloser(bf), nil
	}

}
