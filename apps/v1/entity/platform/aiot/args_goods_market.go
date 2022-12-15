package aiot

import (
	"bytes"
	"encoding/json"
	"strings"
	"time"
)

// ActivityPushReq 下发参数
type ActivityPushReq struct {
	ActivityRule
	FileResource
}

// ActivityRule 活动规则
type ActivityRule struct {
	ActivityType int         `json:"activityType,omitempty"` // 下发类型 1：整机 2：货道
	Sn           *SnActivity `json:"sn,omitempty"`           // sn级别
	Channel      *Channel    `json:"channel,omitempty"`      // 货道级别
}

// Channel 货道活动
type Channel []map[string]ChannelActivity

// String json序列化字符串
func (a ActivityPushReq) String() string {
	var buf []byte
	buffer := bytes.NewBuffer(buf)

	actRule, _ := json.Marshal(a.ActivityRule)
	actStr := strings.TrimSuffix(string(actRule), "\n")

	buffer.Reset()

	json.NewEncoder(buffer).Encode(a.FileResource)
	fileStr := strings.TrimSuffix(buffer.String(), "\n")

	data, _ := json.Marshal(map[string]string{
		"activity": actStr,
		"file":     fileStr,
	})
	return string(data)
}

// ToStopReqString 转为停止请求字符串
func (a ActivityPushReq) ToStopReqString() string {
	var buf []byte
	buffer := bytes.NewBuffer(buf)

	json.NewEncoder(buffer).Encode(a.FileResource)
	fileStr := strings.TrimSuffix(buffer.String(), "\n")
	data, _ := json.Marshal(map[string]string{
		"activity": "",
		"file":     fileStr,
	})
	return string(data)
}

// ToFileReqString 文件资源
func (a ActivityPushReq) ToFileReqString() string {
	var buf []byte
	buffer := bytes.NewBuffer(buf)

	json.NewEncoder(buffer).Encode(a.FileResource)
	fileStr := strings.TrimSuffix(buffer.String(), "\n")
	data, _ := json.Marshal(map[string]string{
		"file": fileStr,
	})
	return string(data)
}

// Key 自定义key
type Key string

const (
	// Activity 活动
	Activity Key = "activity"
	// File 打包后的资源url
	File Key = "file"
)

// KeyOpt 自定义key
type KeyOpt func(map[Key]string)

// ActivityOps 活动规则
func ActivityOps(ar *ActivityRule) KeyOpt {
	return func(m map[Key]string) {
		if ar == nil || ar.ActivityType == 0 || (ar.ActivityType == 1 && ar.Sn == nil) ||
			(ar.ActivityType == 2 && (ar.Channel == nil || len(*ar.Channel) == 0)) ||
			(ar.Sn == nil && (ar.Channel == nil || len(*ar.Channel) == 0)) {
			m[Activity] = ""
			return
		}

		v, err := json.Marshal(ar)
		if err != nil {
			return
		}
		m[Activity] = strings.TrimSuffix(string(v), "\n")
	}
}

// FileOps 文件资源选项
func FileOps(f *FileResource) KeyOpt {
	return func(m map[Key]string) {
		if f == nil {
			m[File] = ""
			return
		}

		v, err := json.Marshal(f)
		if err != nil {
			return
		}
		m[File] = strings.TrimSuffix(string(v), "\n")
	}
}

// Marshal 转为fn map序列化
func (a ActivityPushReq) Marshal(keyOpts ...KeyOpt) string {
	m := make(map[Key]string)
	for _, keyOpt := range keyOpts {
		keyOpt(m)
	}

	v, err := json.Marshal(m)
	if err != nil {
		panic(err)
	}
	return string(v)
}

// SnActivity  Sn活动
type SnActivity struct {
	ActivityType int         `json:"activityType"`          // 活动类型1：抽奖 2：折扣
	LuckAct      LuckAct     `json:"luckAct,omitempty"`     // 抽奖活动
	DiscountAct  DiscountAct `json:"discountAct,omitempty"` // 折扣活动
	ActivityID   string      `json:"activityId"`            // 活动ID
}

// ChannelActivity 货道活动
type ChannelActivity struct {
	ActivityType  int          `json:"activityType"`          // 活动类型1：抽奖 2：折扣
	LuckAct       *LuckAct     `json:"luckAct,omitempty"`     // 抽奖活动
	DiscountAct   *DiscountAct `json:"discountAct,omitempty"` // 折扣活动
	ActivityID    string       `json:"activityId"`            // 活动ID
	GoodsPackLink string       `json:"-"`                     // 货道资源包
	ScenePackLink string       `json:"-"`                     // 通用场景
	UpdatedTime   time.Time    `json:"-"`                     // 活动更新时间
}

// WalletModel 钱包
type WalletModel struct {
	PayCode string `json:"payCode"` // 码制
	DisCost int    `json:"disCost"` // 折扣
}

// DiscountAct 折扣活动
type DiscountAct struct {
	DiscostType int           `json:"discostType"`       // 钱包折扣方式 1全部 2指定钱包
	DisCost     int           `json:"disCost,omitempty"` // 折扣比例 0～100
	DisPayCode  string        `json:"disPayCode"`        // 钱包码制
	DisPayStr   string        `json:"disPayStr"`         // 钱包名称
	Wallet      []WalletModel `json:"wallet"`            // DiscostType 为2时使用
}

// LuckAct 抽奖活动
type LuckAct struct {
	LuckType int    `json:"luckType,omitempty"` // 幸运赠送类型 1:退款 2:买二送一 3:买一送一
	Wallet   string `json:"wallet,omitempty"`   // 钱包id 多个英文逗号分隔
	Percent  string `json:"percent,omitempty"`  // 抽奖比例
}

// Resources 媒体资源
type Resources struct {
	VideoURL   string `json:"vedioURL"`   // 视频url 注意json拼写用的是错误单词
	AudioURL   string `json:"audioURL"`   // 音频url
	PictureURL string `json:"pictureURL"` // 图片url
}

// Config 配置
type Config struct {
	Voice         int `json:"voice,omitempty"` // 音量
	BorderColourR int `json:"borderColourR,omitempty"`
	BorderColourG int `json:"borderColourG,omitempty"`
	BorderColourB int `json:"borderColourB,omitempty"`
	FontColourR   int `json:"fontColourR,omitempty"`
	FontColourG   int `json:"fontColourG,omitempty"`
	FontColourB   int `json:"fontColourB,omitempty"`
}

// FileResource 文件资源
type FileResource struct {
	Resources Resources `json:"resources,omitempty"` // 资源压缩包url
	Config    *Config   `json:"config,omitempty"`    // 配置信息
}

func (a FileResource) String() string {
	var buf []byte
	buffer := bytes.NewBuffer(buf)

	json.NewEncoder(buffer).Encode(a)
	data, _ := json.Marshal(map[string]string{
		"file": strings.TrimSuffix(buffer.String(), "\n"),
	})

	return string(data)
}
