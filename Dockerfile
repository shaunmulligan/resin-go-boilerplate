FROM resin/raspberrypi3-golang:1.6.2-slim-20160712
ENV VERSION=0.0.1
ENV GOBIN=/usr/src/app
WORKDIR $GOPATH
COPY . ./
RUN go install github.com/shaunmulligan/goapp
ENV INITSYSTEM=on
WORKDIR /usr/src/app/
CMD ["./goapp"]
