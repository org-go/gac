package socket

import (
	"fmt"

	"github.com/gorilla/websocket"
)

type client struct {
	socket *websocket.Conn
	server *Server
	send   chan []byte
}

func (this *client) write() {
	defer this.socket.Close()
	for msg := range this.send {
		err := this.socket.WriteMessage(websocket.TextMessage, msg)
		if err != nil {
			fmt.Println(err)
			return
		}
	}
}

func (this *client) read() {
	defer this.socket.Close()
	for {
		_, msg, err := this.socket.ReadMessage()
		if err != nil {
			fmt.Println(err)
			return
		}
		this.server.forward <- msg
	}
}
