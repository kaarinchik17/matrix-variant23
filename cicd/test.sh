#!/bin/bash
echo "==================================="
echo "НАЧИНАЕМ ТЕСТИРОВАНИЕ"
echo "==================================="

# Путь к программе
PROG="./usr/local/bin/matrix"
chmod +x ./usr/local/bin/matrix
# Проверяем, существует ли программа
if [ ! -f "$PROG" ]; then
    echo "ОШИБКА: программа не найдена!"
    exit 1
fi

echo "Тест 1: Запуск с размером 3"
echo "3" | $PROG > test1.log
if [ $? -eq 0 ]; then
    echo "   Тест 1 пройден"
else
    echo "   Тест 1 провален"
    exit 1
fi

echo "Тест 2: Запуск с размером 5"
echo "5" | $PROG > test2.log
if [ $? -eq 0 ]; then
    echo "   Тест 2 пройден"
else
    echo "   Тест 2 провален"
    exit 1
fi

echo "Тест 3: Проверка на ошибку (ввод 0)"
echo "0" | $PROG &> /dev/null
if [ $? -ne 0 ]; then
    echo "   Тест 3 пройден (программа вернула ошибку)"
else
    echo "   Тест 3 провален (должна быть ошибка)"
    exit 1
fi

echo ""
echo " ВСЕ ТЕСТЫ ПРОЙДЕНЫ УСПЕШНО!"
exit 0
