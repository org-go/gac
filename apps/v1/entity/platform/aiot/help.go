package aiot

import (
    "encoding/json"
    "fmt"
)


/**
 * $(decode)
 * @Description:
 * @receiver self
 * @param str
 * @param body
 * @return help
 */
func (self help) decode(str string, body interface{}) help {
    _ = json.Unmarshal([]byte(str), &body)
    return self
}
/**
 * $(error)
 * @Description:
 * @receiver self
 * @param rsp
 * @return err
 */
func (self help) error (rsp StateRsp) (err error) {

    if rsp.Code != success {
        marshal, _ := json.Marshal(rsp)
        err = fmt.Errorf(`%s`, string(marshal))
    }
    return err

}

