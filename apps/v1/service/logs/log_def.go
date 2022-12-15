package logs

import (
	"context"
	"github.com/gin-gonic/gin"
	"payfun.gac.service/apps/v1/entity/assembler"
	"time"
)

//  logger
type logger func(lx *assembler.AdminLogAssembler)

/**
 * $(def)
 * @Description:
 * @receiver this
 * @return assembler.AdminLogAssembler
 */
func (this logger) def(ctx context.Context) assembler.AdminLogAssembler {

	return assembler.AdminLogAssembler{
		OrgPk:       1,
		AppPk:       1,
		Action:      string(assembler.LogActionOther),
		CreatedTime: time.Now(),
		CreatedIp:   ctx.(*gin.Context).ClientIP(),
	}
}
