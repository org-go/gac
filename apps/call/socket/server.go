package socket

type Server struct {
	clients map[*client]bool
	join    chan *client
	leave   chan *client
	forward chan []byte
}

func New() *Server {
	return &Server{
		clients: make(map[*client]bool),
		join:    make(chan *client),
		leave:   make(chan *client),
		forward: make(chan []byte),
	}
}

func (this *Server) Run() {
	for {
		select {
		case client := <-this.join:
			this.clients[client] = true
		case client := <-this.leave:
			delete(this.clients, client)
			close(client.send)
			// case msg := <-this.forward:
			// for i, i2 := range collection {
			// }
		}
	}
}
