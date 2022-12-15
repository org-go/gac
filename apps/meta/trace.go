package meta

type MetaTraceOptions struct {
	Name     string  `json:",optional"`
	Endpoint string  `json:",optional"`
	Sampler  float64 `json:",default=1.0"`
	Batcher  string  `json:",default=jaeger,options=jaeger|zipkin|skywalk"`
}

const (
	TraceName        = "center-service"
	TraceKindJaeger  = "jaeger"
	TraceKindZipkin  = "zipkin"
	TraceKindSkyWalk = "skywalk"
)
