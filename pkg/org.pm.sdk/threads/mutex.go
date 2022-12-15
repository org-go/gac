package threads

import "sync"

type mutex struct {
	look sync.Mutex
}

/**
 * $(Run)
 * @Description:
 * @receiver g
 * @param call
 */
func (g *mutex) Run(call func()) {
	g.look.Lock()
	go func() {
		defer g.look.Unlock()
		call()
	}()
}

/**
 * $(SafeRun)
 * @Description:
 * @receiver g
 * @param call
 */
func (g *mutex) SafeRun(call func()) {
	g.look.Lock()
	GoSafe(func() {
		defer g.look.Unlock()
		call()
	})
}

func (g *mutex) Wait() {
	g.look.Lock()
}
