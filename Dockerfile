FROM golang:alpine AS builder
WORKDIR /app
COPY . .
RUN go build -ldflags '-s -w' main.go

FROM scratch
WORKDIR /
COPY --from=builder /app /
ENTRYPOINT ["/main"]

