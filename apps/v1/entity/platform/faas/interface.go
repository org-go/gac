package faas

import "context"

type (

	// ifaasService
	ifaasService interface {
		//  Locale
		Locale(ctx context.Context, lang string, codes ...string) []interface{}

        //  UploadFile
		UploadFile(ctx context.Context, opts SsoSourceReqs) (links []interface{}, err error)
	}

)
