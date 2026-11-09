FROM golang:1.27-alpine

# Устанавливаем компилятор C, необходимый для SQLite
RUN apk add --no-cache gcc musl-dev

WORKDIR /app

# Копируем файлы модулей и скачиваем зависимости
COPY go.mod go.sum ./
RUN go mod download

# Копируем остальной код и базу данных
COPY . .

# Включаем CGO (CGO_ENABLED=1) для сборки с SQLite
RUN CGO_ENABLED=1 GOOS=linux go build -o main .

EXPOSE 8080

CMD ["./main"]