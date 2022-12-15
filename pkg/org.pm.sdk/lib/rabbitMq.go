package lib

import (
	"fmt"
	"github.com/streadway/amqp"
)

type Mq struct {
	Host     string
	Port     string
	Username string
	Pwd      string
	Vh       string
	Ch       *amqp.Channel
	Conn     *amqp.Connection
	// Queue    string
}

// var q amqp.Queue
func InitRabbitMq(mqSetting Mq) *Mq {
	return &mqSetting
}

func (r *Mq) openConn() {
	var err error
	RabbitUrl := fmt.Sprintf("amqp://%s:%s@%s:%s/%s", r.Username, r.Pwd, r.Host, r.Port, r.Vh)
	r.Conn, err = amqp.Dial(RabbitUrl)
	r.failOnError(err, "Failed to connect to RabbitMQ")
	r.Ch, err = r.Conn.Channel()
	r.failOnError(err, "Failed to open a channel")
}

func (r *Mq) SendMsg(queue string, msg []byte) {
	if r.Conn == nil || r.Conn.IsClosed() || r.Ch == nil {
		r.openConn()
	}

	err := r.Ch.Publish(
		"",    //exchange
		queue, //routing key
		false,
		false,
		amqp.Publishing{
			DeliveryMode: amqp.Persistent, //Msg set as persistent
			ContentType:  "text/plain",
			Body:         msg,
		})
	r.failOnError(err, "Failed to publish a message")

}

func (r *Mq) failOnError(err error, msg string) {
	if err != nil {
		fmt.Printf("%s: %s\n", msg, err)
		panic(err)
	}
}
