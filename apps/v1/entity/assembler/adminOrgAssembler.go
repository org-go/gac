package assembler

import (
    "payfun.gac.service/apps/v1/entity/model"
    "payfun.gac.service/pkg/org.pm.sdk/lib"
    "time"
)

type (
    AdminOrgAssembler  model.AdminOrg
    AdminOrgAssemblers []AdminOrgAssembler
)


/**
 * $(OPT)
 * @Description:
 * @receiver self
 * @return AdminOrgAssembler
 */
func (self *AdminOrgAssembler) OPT() AdminOrgAssembler {
    self.Code = lib.SnowFlake.Sid()
    self.Status = 1
    self.CreatedTime = time.Now()
    return *self
}
