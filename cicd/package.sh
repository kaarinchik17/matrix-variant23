#!/bin/bash
echo "==================================="
echo "СБОРКА DEB-ПАКЕТА"
echo "==================================="

# Создаём временную папку для пакета
mkdir -p temp-package/usr/local/bin
mkdir -p temp-package/DEBIAN

# Копируем программу
cp usr/local/bin/matrix temp-package/usr/local/bin/

# Копируем control файл (из первой лабораторной)
if [ -f DEBIAN/control ]; then
    cp DEBIAN/control temp-package/DEBIAN/
else
    # Если control файла нет, создаём его
    cat > temp-package/DEBIAN/control << EOF
Package: matrix-variant23
Version: 1.0.0
Section: utils
Priority: optional
Architecture: amd64
Depends: libc6
Maintainer: kaarinchik17 <karunchik17@gmail.com>
Description: Matrix program for variant 23
 Program finds sum on main diagonal and product on secondary diagonal.
EOF
fi

# Собираем пакет
dpkg-deb --build temp-package

# Переименовываем пакет
mv temp-package.deb matrix-variant23-$(date +%Y%m%d).deb

# Удаляем временную папку
rm -rf temp-package

echo " ПАКЕТ СОЗДАН: matrix-variant23-$(date +%Y%m%d).deb"
ls -la *.deb
