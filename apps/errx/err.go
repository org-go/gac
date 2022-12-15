package errx

import (
    "errors"
    "fmt"
    "golang.org/x/text/language"
    "net/http"
    "payfun.gac.service/apps/v1/entity/assembler"
)

const (
    errUnknownErrorName = "error"
    errRequestErrorName = "param error"
)

var (
    Unknown *RFC6749Error = &RFC6749Error{
        Code:             http.StatusBadRequest,
        ErrorField:       errUnknownErrorName,
        DescriptionField: `未知错误，请联系管理员`,
        CodeField:        `COMMON_MSG_00010`,
        exposeDebug:      false,
    }

    Rquest *RFC6749Error = &RFC6749Error{
        Code:             http.StatusBadRequest,
        ErrorField:       errRequestErrorName,
        DescriptionField: "请求参数错误",
        CodeField:        `COMMON_MSG_00009`,
        exposeDebug:      false,
    }
)

//
//  RFC6749Error
//  @Description:
//
type (
    RFC6749Error struct {
        Code             int
        ErrorField       string
        DescriptionField string
        CodeField        string
        DebugField       string
        cause            error
        alarm            bool
        useLegacyFormat  bool
        exposeDebug      bool
        log              log
        lang             Lang
    }
    log struct {
        Action assembler.LogAction
        Module assembler.LogModule
        Record string
    }
)

/**
 * $(ErrorToRFC6749Error)
 * @Description:
 * @param err
 * @return *RFC6749Error
 */
func ErrorToRFC6749Error(err error) *RFC6749Error {
    var e *RFC6749Error
    if errors.As(err, &e) {
        return e
    }
    return &RFC6749Error{
        ErrorField:       errUnknownErrorName,
        DescriptionField: "-------",
        DebugField:       err.Error(),
        Code:             http.StatusInternalServerError,
        CodeField:        `CENTER_ERROR`,
        cause:            err,
        lang:             nil,
    }
}

/**
 * $(Cause)
 * @Description:
 * @receiver e
 * @return error
 */
func (e *RFC6749Error) Cause() error {
    return e.cause
}

/**
 * $(Status)
 * @Description:
 * @receiver e
 * @return string
 */
func (e *RFC6749Error) Status() string {

    return http.StatusText(e.Code)

}

/**
 * $(Lang)
 * @Description:
 * @receiver e
 * @return string
 */
func (e *RFC6749Error) Lang() string {

    return e.lang.GetMessage(e.CodeField, language.Tag{})

}

/**
 * $(RFC6749Error)
 * @Description:
 * @receiver e
 * @return string
 */
func (e *RFC6749Error) Error() string {

    switch {
    case e.alarm == true:

    }
    err := fmt.Sprintf(`%s`, e.cause)
    return err
}

/**
 * $(CodeFile)
 * @Description:
 * @receiver e
 */
func (e *RFC6749Error) CodeFile() string {
    return e.CodeField
}

/**
 * $(CodeError)
 * @Description:
 * @receiver e
 * @return error
 */
func (e *RFC6749Error) CodeError() error {
    return fmt.Errorf(`%s`, e.CodeField)
}

//
//  Lang
//  @Description:
//
type Lang interface {
    GetMessage(ID string, tag language.Tag, v ...interface{}) string
}


/**
 * $(Log)
 * @Description:
 * @receiver e
 * @param lx
 * @param status
 */
func (e *RFC6749Error) Log(lx *assembler.AdminLogAssembler, status func() string) {
    lx.Action = string(e.log.Action)
    lx.Module = string(e.log.Module)
    str := `-`
    if status != nil {
        str = status()
    }
    lx.Record = fmt.Sprintf(e.log.Record, str)
}
