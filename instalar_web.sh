#!/bin/bash

echo "1. Instalando Apache, PHP y Git..."
# Actualizo la lista de paquetes disponibles en los repositorios
apt-get update

# Instalo los programas
# libapache2-mod-php es el puente para que Apache entienda PHP
# php-mysql es el driver para que PHP pueda conectarse a bases de datos
apt-get install -y apache2 php libapache2-mod-php php-mysql git

echo "2. Descargando la aplicación web de GitHub..."
cd /tmp

# Descargo una copia exacta del código fuente del repositorio
git clone https://github.com/josejuansanchez/iaw-practica-lamp.git

echo "3. Desplegando la aplicación en el directorio de Apache..."
# Borro el index.html de bienvenida que trae Apache por defecto
rm /var/www/html/index.html

# Copio de forma recursiva el código de la app a la ruta donde Apache sirve las páginas web (/var/www/html/)
cp -r /tmp/iaw-practica-lamp/src/* /var/www/html/

echo "4. Aplicando Criterio CC4: Ajustes de conexión a la Base de Datos..."
# El comando sed -i "s/viejo/nuevo/" busca un texto y lo sustituye por otro, guardando los cambios directamente en el archivo (-i).
# Aquí reemplazo los datos genéricos por los de nuestro servidor de BD aislado.
sed -i "s/'localhost'/'192.168.50.20'/" /var/www/html/config.php
sed -i "s/'database_name_here'/'lamp_db'/" /var/www/html/config.php
sed -i "s/'username_here'/'lamp_user'/" /var/www/html/config.php
sed -i "s/'password_here'/'lamp_password'/" /var/www/html/config.php

echo "5. Reiniciando el servicio..."
# Reinicio Apache para que aplique los nuevos módulos instalados y lea la web
systemctl restart apache2

echo "Servidor Web aprovisionado correctamente."