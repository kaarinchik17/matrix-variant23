#!/bin/bash
echo "==================================="
echo "НАЧИНАЕМ СБОРКУ ПРОГРАММЫ"
echo "==================================="

# Переходим в папку с исходниками
cd src

# Очищаем предыдущую сборку
make clean

# Собираем программу
make

# Проверяем, создался ли файл matrix
if [ -f matrix ]; then
    echo " СБОРКА УСПЕШНА! Файл matrix создан"
    
    # Создаём нужные папки и копируем туда программу
    mkdir -p ../usr/local/bin
    cp matrix ../usr/local/bin/
    
    echo " Программа скопирована в usr/local/bin/matrix"
    exit 0
else
    echo " ОШИБКА: файл matrix не создан!"
    exit 1
fi
