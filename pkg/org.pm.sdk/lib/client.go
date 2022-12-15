package lib

import (
	"bytes"
	"context"
	"encoding/json"
	"fmt"
	"io"
	"io/ioutil"
	"net"
	"net/http"
	"net/url"
	"strings"
	"time"
)

// NewDefaultHTTPClient 客户端
func NewDefaultHTTPClient() *http.Transport {
	return &http.Transport{
		Proxy: http.ProxyFromEnvironment,
		DialContext: (&net.Dialer{
			Timeout:   30 * time.Second,
			KeepAlive: 30 * time.Second,
			DualStack: true,
		}).DialContext,
		IdleConnTimeout:       90 * time.Second,
		TLSHandshakeTimeout:   10 * time.Second,
		ExpectContinueTimeout: 1 * time.Second,
		DisableKeepAlives:     true,
		MaxIdleConnsPerHost:   -1,
	}
}

// RequestURL get request url
// 拼接host和router，确保host和router中间只有一个“/”
func RequestURL(host, route string) string {
	var buf bytes.Buffer
	if l := len(host); l > 0 {
		if host[l-1] == '/' {
			host = host[:l-1]
		}
		buf.WriteString(host)

		if rl := len(route); rl > 0 {
			if route[0] != '/' {
				buf.WriteByte('/')
			}
		}
	}
	buf.WriteString(route)
	return buf.String()
}

// RequestOption 自定义处理请求
type RequestOption func(*http.Request) (*http.Request, error)

// Get get request
func Get(ctx context.Context, urlStr string, param url.Values, options ...RequestOption) (Responser, error) {
	if param != nil {
		c := '?'
		if strings.IndexByte(urlStr, '?') != -1 {
			c = '&'
		}
		urlStr = fmt.Sprintf("%s%c%s", urlStr, c, param.Encode())
	}

	return Request(ctx, urlStr, http.MethodGet, nil, options...)
}

// Post Post请求
func Post(ctx context.Context, urlStr string, body io.Reader, result interface{}, options ...RequestOption) error {
	w := new(bytes.Buffer)
	if err := json.NewEncoder(w).Encode(body); err != nil {
		return err
	}

	resp, err := Request(ctx, urlStr, http.MethodPost, w, options...)
	if err != nil {
		return err
	}

	return parseResponseJSON(resp, result)

}

// Request HTTP请求
func Request(ctx context.Context, urlStr, method string, body io.Reader, options ...RequestOption) (Responser, error) {
	if ctx == nil {
		ctx = context.Background()
	}
	req, err := http.NewRequest(method, urlStr, body)
	if err != nil {
		return nil, err
	}

	if len(options) > 0 {
		req, err = options[0](req)
		if err != nil {
			return nil, err
		}
	}

	var res Responser
	err = request(ctx, req, func(resp *http.Response, err error) error {
		if err != nil {
			return err
		}
		res = newResponse(resp)
		return nil
	})
	if err != nil {
		return nil, err
	}

	return res, nil
}

// HTTP请求处理
func request(ctx context.Context, req *http.Request, f func(*http.Response, error) error) error {
	tr := NewDefaultHTTPClient()

	cli := &http.Client{Transport: tr}
	c := make(chan error, 1)
	go func() { c <- f(cli.Do(req)) }()
	select {
	case <-ctx.Done():
		tr.CancelRequest(req)
		<-c
		return ctx.Err()
	case err := <-c:
		return err
	}
}

// ErrorResult 错误结果
type ErrorResult struct {
	Code    int    `json:"code"`
	Message string `json:"message"`
}

func (r *ErrorResult) Error() string {
	return r.Message
}

// 解析响应JSON
func parseResponseJSON(resp Responser, result interface{}) error {
	if resp.Response().StatusCode != 200 {
		buf, err := resp.Bytes()
		if err != nil {
			return err
		}

		errResult := &ErrorResult{}
		err = json.Unmarshal(buf, errResult)
		if err == nil &&
			(errResult.Code != 0 || errResult.Message != "") {
			return errResult
		}

		return fmt.Errorf("%s", buf)
	} else if result == nil {
		resp.Close()
		return nil
	}
	return resp.JSON(result)
}

// Responser HTTP response interface
type Responser interface {
	String() (string, error)
	Bytes() ([]byte, error)
	JSON(v interface{}) error
	Response() *http.Response
	Close()
}

func newResponse(resp *http.Response) *response {
	return &response{resp}
}

type response struct {
	resp *http.Response
}

func (r *response) Response() *http.Response {
	return r.resp
}

func (r *response) String() (string, error) {
	b, err := r.Bytes()
	if err != nil {
		return "", err
	}
	return string(b), nil
}

func (r *response) Bytes() ([]byte, error) {
	defer r.resp.Body.Close()

	buf, err := ioutil.ReadAll(r.resp.Body)
	if err != nil {
		return nil, err
	}
	return buf, nil
}

func (r *response) JSON(v interface{}) error {
	defer r.resp.Body.Close()

	return json.NewDecoder(r.resp.Body).Decode(v)
}

func (r *response) Close() {
	if !r.resp.Close {
		r.resp.Body.Close()
	}
}
