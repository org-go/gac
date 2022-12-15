package assembler

import (
	"encoding/json"
	"fmt"
	"time"

	"payfun.gac.service/apps/v1/entity/model"
	"payfun.gac.service/pkg/org.pm.sdk/lib"
	"payfun.gac.service/pkg/org.pm.sdk/sign/hashx"
)

type (
	AdminAppAssembler  model.AdminApp
	AdminAppAssemblers []AdminAppAssembler
)

/**
 * $(OPT)
 * @Description:
 * @receiver self
 * @return AdminAppAssembler
 */
func (self *AdminAppAssembler) OPT() AdminAppAssembler {

	self.Id = lib.SnowFlake.Sid()
	self.Status = 1
	self.CreatedTime = time.Now()
	b, _ := json.Marshal(self)
	self.ApiSecret = fmt.Sprintf(`%d`, hashx.Murmur64(b))
	return *self

}
