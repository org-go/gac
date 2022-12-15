package worker

import (
	"fmt"

	"github.com/RichardKnop/machinery/v1/tasks"
	"github.com/gin-gonic/gin"
)

var (
	asyncTaskMap map[string]interface{}
)


const (
	HelloWorldTaskName          = "HelloWorldTask"
	DeleteAppShareImageTaskName = "DeleteAppShareImageTask"
)

// HelloWorld
func HelloWorld() error {
	fmt.Println("Hello World!")
	return nil
}

// SendHelloWorldTask
func SendHelloWorldTask(ctx *gin.Context) {
	args := make([]tasks.Arg, 0)
	task, _ := tasks.NewSignature(HelloWorldTaskName, args)
	task.RetryCount = 5
	withContext, err := AsyncTaskCenter.SendTaskWithContext(ctx.Request.Context(), task)
	fmt.Println(withContext, err)
}

func initAsyncTaskMap() {
	asyncTaskMap = make(map[string]interface{})
	asyncTaskMap[HelloWorldTaskName] = HelloWorld
}
