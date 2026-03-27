#!/bin/bash
echo "==================================="
echo "НАЧИНАЕМ СБОРКУ ПРОГРАММЫ"
echo "==================================="

cd src
make clean
make

if [ -f matrix ]; then
    echo " СБОРКА УСПЕШНА!"
    
    # Создаём нужные папки
    mkdir -p ../usr/local/bin
    mkdir -p ../DEBIAN
    
    # Копируем программу
    cp matrix ../usr/local/bin/
    
    # Копируем control файл, если он существует
    if [ -f ../DEBIAN/control ]; then
        cp ../DEBIAN/control ../DEBIAN/control.bak 2>/dev/null
    fi
    
    # Даём права на выполнение
    chmod +x ../usr/local/bin/matrix
    
    echo " Программа скопирована в usr/local/bin/matrix"
    exit 0
else
    echo " ОШИБКА: файл matrix не создан!"
    exit 1
fi
