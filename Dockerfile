FROM golang:1.27-alpine

WORKDIR /app

# Копируем файл модулей
COPY go.mod ./
RUN go mod download

# Копируем весь остальной код
COPY . .

# Собираем приложение в исполняемый файл "main"
RUN go build -o main .

# Указываем порт
EXPOSE 8080

# Запускаем сервер
CMD ["./main"]