package aiot

import (
    "github.com/wangcheng0509/gpkg/loghelp"
)

type err func(err error)

var (
    partnerSsoUserError err = func(err error) {
        loghelp.Error(`aiot sso error:`, err.Error(), false)
    }
    partnerMarketPushError err = func(err error) {
        loghelp.Error(`aiot market push error:`, err.Error(), false)
    }
    partnerMarketGetError err = func(err error) {
        loghelp.Error(`aiot market get error:`, err.Error(), false)
    }
)

