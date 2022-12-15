FROM golang:latest
WORKDIR $GOPATH/src/payfun.gac.service
COPY . .
EXPOSE 80
ENTRYPOINT ["./goapp"]

