#!/bin/bash
echo "==================================="
echo "СБОРКА DEB-ПАКЕТА"
echo "==================================="

# Создаём временную папку для пакета
mkdir -p temp-package/usr/local/bin
mkdir -p temp-package/DEBIAN

# Копируем программу
cp usr/local/bin/matrix temp-package/usr/local/bin/

# Копируем control файл
if [ -f DEBIAN/control ]; then
    cp DEBIAN/control temp-package/DEBIAN/
else
    cat > temp-package/DEBIAN/control << EOF
Package: matrix-variant23
Version: 1.0.0
Section: utils
Priority: optional
Architecture: amd64
Depends: libc6
Maintainer: Student <student@example.com>
Description: Matrix program for variant 23
 Program finds sum on main diagonal and product on secondary diagonal.
EOF
fi

# Собираем пакет
dpkg-deb --build temp-package

# Переименовываем пакет в фиксированное имя для Dockerfile
mv temp-package.deb matrix-variant23.deb

# Удаляем временную папку
rm -rf temp-package

echo " ПАКЕТ СОЗДАН: matrix-variant23.deb"
ls -la *.deb
