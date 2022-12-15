package mq

import (
	"fmt"
	"sync"

	"github.com/streadway/amqp"
)

var MqSvc *Rabbit

// use prototype before call proto func
type (
	iCloneable interface {
		clone() iCloneable
	}
)

type Rabbit struct {
	Host    string
	Port    string
	User    string
	Pwd     string
	Vh      string
	channel *amqp.Channel
	conn    *amqp.Connection
	Option
}

//
//  Option
//  @Description:
//
type Option struct {
	*sync.Mutex
	header   map[string]interface{}
	exchange string
	vh       string
}

//
type invoke func(o *Option)

/**
 * $(Initialize)
 * @Description:
 * @param set
 * @return *Rabbit
 */
func Initialize(set Rabbit) *Rabbit {

	link := fmt.Sprintf("amqp://%s:%s@%s:%s/%s", set.User, set.Pwd, set.Host, set.Port, set.Vh)
	var err error
	set.conn, err = amqp.Dial(link)
	if err != nil {
		fmt.Println(err)
	} else {
		set.header = make(map[string]interface{})
		set.channel, _ = set.conn.Channel()
	}

	return &set
}

/**
 * $(clone)
 * @Description:
 * @receiver r
 * @return Rabbit
 */
func (r *Rabbit) clone() iCloneable {
	rs := *r
	rs.conn.Config.Vhost = r.Option.vh
	rs.channel, _ = r.conn.Channel()
	return &rs

}

/**
 * $(Set)
 * @Description:
 * @receiver r
 * @param in
 * @return Rabbit
 */
func (r *Rabbit) Set(in invoke) Rabbit {
	in(&r.Option)
	if r.vh != `` {
		r = r.clone().(*Rabbit)
	}
	return *r
}

/**
 * $(Send)
 * @Description:
 * @receiver r
 * @param queue
 * @param message
 * @return error
 */
func (r Rabbit) Send(queue string, message []byte) error {
	return r.channel.Publish(
		r.exchange, queue, false, false,
		amqp.Publishing{Headers: r.header, DeliveryMode: amqp.Persistent, //Msg set as persistent
			ContentType: "text/plain", Body: message,
		})
}

/**
 * $(SetHeader)
 * @Description:
 * @receiver o
 * @param key
 * @param val
 */
func (o *Option) SetHeader(key, val string) {
	o.header[key] = val
}

/**
 * $(SetExchange)
 * @Description:
 * @receiver o
 * @param ex
 */
func (o *Option) SetExchange(ex string) {
	o.exchange = ex
}

/**
 * $(SetVh)
 * @Description:
 * @receiver o
 * @param vh
 */
func (o *Option) SetVh(vh string) {
	o.vh = vh
}
