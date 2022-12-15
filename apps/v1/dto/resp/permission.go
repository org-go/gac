package resp

import "payfun.gac.service/apps/v1/entity/assembler"

// QueryPermissionResp 返回权限列表
type QueryPermissionResp map[string]assembler.MenuAssemblers // 返回权限列表
