package meta

import "context"

const EdgeKey = `pm`

type (
    Key string

	MetaEdgeOptions struct {
        ID int
        Name string
        Count int
        Retry int
        Replay interface{}
    }
)

type name struct {
    ctx context.Context

}
