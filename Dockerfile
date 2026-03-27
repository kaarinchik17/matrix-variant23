# Используем Ubuntu 22.04
FROM ubuntu:22.04

# Отключаем интерактивные запросы при установке
ENV DEBIAN_FRONTEND=noninteractive

# Устанавливаем необходимые пакеты
RUN apt-get update && apt-get install -y \
    gcc \
    make \
    dpkg-dev \
    && rm -rf /var/lib/apt/lists/*

# Создаем рабочую директорию
WORKDIR /app

# Копируем исходники
COPY src/ ./src/

# Собираем программу
WORKDIR /app/src
RUN make clean && make

# Создаем директорию для бинарника
RUN mkdir -p /usr/local/bin

# Копируем бинарник в системную папку
RUN cp matrix /usr/local/bin/

# Даем права на выполнение
RUN chmod +x /usr/local/bin/matrix

# Добавляем в PATH
ENV PATH="/usr/local/bin:${PATH}"

# Устанавливаем рабочую директорию
WORKDIR /app

# Команда по умолчанию (можно переопределить при запуске)
ENTRYPOINT ["matrix"]

# Аргумент по умолчанию (размер матрицы)
CMD ["5"]
