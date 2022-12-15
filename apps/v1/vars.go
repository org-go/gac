package v1

import (
	dapr "github.com/dapr/go-sdk/client"
	"go.opentelemetry.io/otel/trace"
)

var (
	/*
	   desc:
	       trace client
	   use:
	       ctx, span := v1.Tracer.Start(ctx, `event.repo`)
	       span.AddEvent(`repo.page`)
	       span.End()
	*/
	Tracer trace.Tracer

	/*
	   desc:
	       dapr client
	   use:
	       state, err := this.edge.Dapr.GetState(c.Request.Context(), meta.Dstore, `name`)
	       method, err := v1.Dapr.InvokeMethod(c.Request.Context(), `center-service`, `center/v1/globe/common/levels`, `get`)
	*/
	Dapr dapr.Client


)




