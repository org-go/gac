package middleware

import (
	"context"
	"encoding/json"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/wangcheng0509/gpkg/loghelp"
	"go.opentelemetry.io/otel"
	"go.opentelemetry.io/otel/attribute"
	"go.opentelemetry.io/otel/exporters/jaeger"
	"go.opentelemetry.io/otel/exporters/zipkin"
	"go.opentelemetry.io/otel/propagation"
	"go.opentelemetry.io/otel/sdk/resource"
	"go.opentelemetry.io/otel/trace"
	"payfun.gac.service/apps/meta"
	v1 "payfun.gac.service/apps/v1"
	"payfun.gac.service/apps/v1/service/auths"
	"payfun.gac.service/pkg/org.pm.sdk/setting"
	"strings"
	"time"
)
import (
	sdktrace "go.opentelemetry.io/otel/sdk/trace"
	semconv "go.opentelemetry.io/otel/semconv/v1.4.0"
)

var err error = fmt.Errorf(`center.trace.error`)

const (


	/*
		use:	W3C
		link: 	https://www.w3.org/TR/trace-context/
		demo:	00-4bf92f3577b34da6a3ce929d0e0e4736-00f067aa0ba902b7-01
				version-traceId-parentID-sampled
		http:	traceparent
		grpc:	grpc-trace-bin

	*/
	httpTrace = `traceparent`

	grpcTrace = `grpc-trace-bin`

	componentIdHttpServer = 5006

)

func Tracer() gin.HandlerFunc {

	opt := meta.MetaTraceOptions{
		Name:     meta.TraceName,
		Endpoint: setting.AppSetting.Zipkin,
		//Endpoint: `http://127.0.0.1:9411/api/v2/spans`,
		Sampler:  1.0,
		Batcher:  meta.TraceKindZipkin,
	}

	opts := []sdktrace.TracerProviderOption{
		sdktrace.WithSampler(sdktrace.ParentBased(sdktrace.TraceIDRatioBased(opt.Sampler))),
		sdktrace.WithResource(resource.NewSchemaless(semconv.ServiceNameKey.String(opt.Name))),
	}
	if opt.Endpoint != `` {
		exporter, err := createExporter(opt)
		if err != nil {
			fmt.Println(opt.Endpoint, err)
		}
		opts = append(opts, sdktrace.WithBatcher(exporter))
	}

	otel.SetTracerProvider(sdktrace.NewTracerProvider(opts...))
	otel.SetTextMapPropagator(propagation.NewCompositeTextMapPropagator(propagation.TraceContext{}, propagation.Baggage{}))
	otel.SetErrorHandler(otel.ErrorHandlerFunc(func(err error) {
		loghelp.Error(`otel`, err.Error(), false)
	}))
	prov := otel.GetTracerProvider()

	return func(c *gin.Context) {
		var (
			key string
		)
		if spl := strings.Split(c.FullPath(), `/`); len(spl) > 2 {
			key = spl[3]
		}

		remote := remoteCtx(c)
		v1.Tracer  = prov.Tracer(c.FullPath())

		ctx, span := v1.Tracer.Start(remote, c.FullPath())
		span.IsRecording()

		span.AddEvent(`begin`, trace.WithStackTrace(true), trace.WithTimestamp(time.Now()))
		s, _ := json.Marshal(c.Request.Header)
		span.SetAttributes(attribute.String(`header`, string(s)))
		span.SetAttributes(attribute.StringSlice(key, []string{auths.Authorized.AccountID}))
		span.AddEvent(`finish`, trace.WithStackTrace(true), trace.WithTimestamp(time.Now()))

		if !span.SpanContext().IsValid() {
			span.RecordError(err, trace.WithTimestamp(time.Now()))
		}
		span.End()

		c.Request = c.Request.WithContext(ctx)

		c.Next()

		//span.End()
	}

}



func createExporter(opt meta.MetaTraceOptions) (sdktrace.SpanExporter, error) {
	switch opt.Batcher {
	case meta.TraceKindJaeger:
		return jaeger.New(jaeger.WithCollectorEndpoint(jaeger.WithEndpoint(opt.Endpoint)))
	case meta.TraceKindZipkin:
		return zipkin.New(opt.Endpoint)
	default:
		return nil, fmt.Errorf(`error`)
	}
}

/**
 * $(remoteCtx)
 * @Description:
 * @param c
 * @return context.Context
 */
func remoteCtx(c *gin.Context) context.Context {
	var (
		sp []string
		pid trace.TraceID
	)
	if t := c.GetHeader(httpTrace); strings.ContainsAny(t, `-`) {
		sp = strings.Split(t, `-`)
	}
	if len(sp) > 2 {
		pid, _ = trace.TraceIDFromHex(sp[1])
	}
	sc := trace.NewSpanContext(trace.SpanContextConfig{
		TraceID: pid,
	})
	return trace.ContextWithRemoteSpanContext(c, sc)

}
