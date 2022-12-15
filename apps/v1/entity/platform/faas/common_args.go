package faas



type SsoSourceReqs []SsoSourceReq
//
//  SsoSourceReq
//  @Description:
//
type SsoSourceReq struct {
    Byte []byte `json:"byte"` // 资源信息
    File string `json:"file"` // 文件名 1.png
}
