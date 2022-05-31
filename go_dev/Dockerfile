FROM golang:1-alpine AS dlv-builder

WORKDIR /

RUN go install github.com/go-delve/delve/cmd/dlv@latest

FROM alpine:3

RUN apk add --no-cache git make build-base

WORKDIR /app

COPY --from=dlv-builder /go/bin/dlv ./

COPY build/app ./

ENTRYPOINT ["./dlv", "exec", "./app", "--headless", "--listen=:2345", "--api-version=2", "--accept-multiclient", "--continue", "--log"]
