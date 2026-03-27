#!/bin/bash
echo "==================================="
echo "ТЕСТИРОВАНИЕ DOCKER-ОБРАЗА"
echo "==================================="

# Тест 1: запуск с размером 3
echo "Тест 1: Запуск с размером 3"
docker run --rm matrix-variant23:latest 3
if [ $? -eq 0 ]; then
    echo " Тест 1 пройден"
else
    echo " Тест 1 провален"
    exit 1
fi

# Тест 2: запуск с размером 5
echo "Тест 2: Запуск с размером 5"
docker run --rm matrix-variant23:latest 5
if [ $? -eq 0 ]; then
    echo " Тест 2 пройден"
else
    echo " Тест 2 провален"
    exit 1
fi

# Тест 3: проверка обработки ошибки (ввод 0)
echo "Тест 3: Проверка обработки некорректного ввода"
docker run --rm matrix-variant23:latest 0
if [ $? -ne 0 ]; then
    echo " Тест 3 пройден (ошибка обработана)"
else
    echo " Тест 3 провален (должна быть ошибка)"
    exit 1
fi

echo ""
echo " ВСЕ ТЕСТЫ DOCKER-ОБРАЗА ПРОЙДЕНЫ"
exit 0
