CC = gcc
CFLAGS = -Wall -Wextra -std=c11
TARGET = matrix
SRC = matrix.c

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC)

clean:
	rm -f $(TARGET)

check-deps:
	@command -v $(CC) >/dev/null 2>&1 || { echo "Ошибка: gcc не установлен"; exit 1; }
	@echo "Все зависимости установлены"

run: $(TARGET)
	./$(TARGET)

.PHONY: clean check-deps run
