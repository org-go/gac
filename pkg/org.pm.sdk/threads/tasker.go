package threads

type limit interface{}

type Task struct {
	lt chan limit
}

/**
 * $(NewTask)
 * @Description:
 * @param concurrency
 * @return *Task
 */
func NewTask(concurrency int) *Task {
	return &Task{lt: make(chan limit, concurrency)}
}
/**
 * $(Schedule)
 * @Description:
 * @receiver t
 * @param task
 */
func (t Task) Schedule(task func()) {
	t.lt <- task
	go func() {
		defer Recover(func() {
			<-t.lt
		})
		task()
	}()

}
