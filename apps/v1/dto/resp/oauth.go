package resp

// TargetUrl TargetUrl信息
type TargetUrl struct {
	OauthType int    `json:"oauth_type" ` //  类型 1: Line 2: Twitter
	Url       string `json:"url" `        // 跳转地址
}

type TargetUrls []TargetUrl
