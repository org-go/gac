package aiot

//
//  PushWithSignReq
//  @Description:
//
type PushWithSignReq struct {
	SignReq
	BizDefineActivityPubReq
}

//
//  SerialNumListWithSignReq
//  @Description:
//
type SerialNumListWithSignReq struct {
	SignReq
	SerialNumListReq
}

// ChannelPrice 货道价格
type ChannelPrice struct {
	No    int `json:"no"`
	Price int `json:"price"`
}

// SnPrice sn价格
type SnPrice struct {
	Type    int       `json:"type"`    // 1表示所有货道使用统一的折扣率活动，2表示处理payCost数组里面的钱包折扣率活动
	Discost int       `json:"discost"` // 折扣率，1-99
	PayCost []PayCost `json:"payCost"` // 支付通道折扣列表
}

// PayCost 支付通道折扣
type PayCost struct {
	PayCode string `json:"payCode"` // 支付通道码
	Discost int    `json:"discost"` // 折扣率，1-99
}

// BizDefineActivityPubReq 设备活动下发
type BizDefineActivityPubReq struct {
	SerialNumList []string `json:"serialNumList"` // 设备sn号列表，单次最大200个
	BizDefine     string   `json:"bizDefine"`     // {"key":"value","key2":"value2"} 自定义下发内容，key-value形式,对于可以相同更新，不同增加
}

// SerialNumList 设备sn号列表，单次最大20个
type SerialNumListReq struct {
	SerialNumList []string `json:"serialNumList"`
}

// DeviceBizDefinePub 设备下发
type DeviceBizDefinePubResp struct {
	StateRsp
}

// DeviceBizDefineResp 设备参数
type DeviceBizDefineResp struct {
	SerialNum string `json:"serialNum"` // sn
	BizDefine string `json:"bizDefine"` // 自定义参数
}

// Data .
type Data struct {
	DeviceList []DeviceBizDefineResp `json:"data"`
}

// DeviceBizDefinePubGetResp 设备参数查询
type DeviceBizDefinePubGetResp struct {
	StateRsp
	Data Data `json:"data"`
}

const (
	// WechatPay 微信
	WechatPay = iota + 1
	// AliPay 支付宝
	AliPay
	// UnionPay 银联二维码
	UnionPay
	// CCBLong 。。
	CCBLong
	// PayPay PayPay
	PayPay
	// LinePay LinePay
	LinePay
	// ViaPay  ViaPay
	ViaPay
	// ACDPay ACDPay
	ACDPay
	// AupayPay AupayPay
	AupayPay
	// BTCPay BTCPay
	BTCPay
	// DocomoPay DocomoPay
	DocomoPay
	// NetsPay NetsPay
	NetsPay
	// RPay RPay
	RPay
	// SolPay SolPay
	SolPay
	// TBTCPay TBTCPay
	TBTCPay
)
