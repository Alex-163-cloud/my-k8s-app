# Используем официальный образ Go для сборки
FROM golang:1.23-alpine AS builder

WORKDIR /app
COPY go.mod main.go ./
RUN go build -o my-app main.go

# Используем минимальный образ для запуска
FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/my-app .
EXPOSE 8080
CMD ["./my-app"]
