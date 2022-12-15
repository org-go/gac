package resp

import "payfun.gac.service/apps/v1/entity/assembler"

type (
	OptionResps []OptionResp
	//  OptionResp
    OptionResp struct {
        Id   int    `json:"id"`
        Name string `json:"name"`
    }
)

/**
 * $(Option)
 * @Description:
 * @receiver self
 * @param id
 * @param name
 * @return OptionResp
 */
func (self OptionResps) Apps (apps assembler.AdminAppAssemblers) OptionResps {
    if len(apps) == 0 {
        return self
    }
    for _, app := range apps {
        self = append(self, OptionResp{
            Id:   int(app.Pk),
            Name: app.Name,
        })
    }
    return self
}

/**
 * $(Option)
 * @Description:
 * @receiver self
 * @param id
 * @param name
 * @return OptionResp
 */
func (self OptionResps) Orgs (orgs assembler.AdminOrgAssemblers) OptionResps {
    if len(orgs) == 0 {
        return self
    }
    for _, org := range orgs {
        self = append(self, OptionResp{
            Id:   int(org.Pk),
            Name: org.Name,
        })
    }
    return self
}
