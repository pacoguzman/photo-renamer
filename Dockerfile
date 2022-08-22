# Builder
FROM golang:1.19.0-alpine3.16 AS builder
RUN apk add --no-cache git
WORKDIR /app
COPY go.mod go.sum ./
RUN go get -d -v ./...
COPY . .
RUN go build -o renamer main.go

# Final image
FROM alpine:3.16
LABEL maintainer="pacoguzmanp@gmail.com"

COPY --from=builder /app/renamer /

ENTRYPOINT [ "/renamer" ]
