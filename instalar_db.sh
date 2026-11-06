#!/bin/bash

echo "1. Instalando motor de base de datos..."
# Instalamos MariaDB, que es la versión de software libre de MySQL incluida en Debian
apt-get update
apt-get install -y mariadb-server

echo "2. Configurando acceso externo..."
# Por defecto, la base de datos rechaza conexiones de otros equipos.
# Con 'sed' le decimos que escuche en todas sus IPs (0.0.0.0), permitiendo que la máquina Web se conecte.
sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
systemctl restart mariadb

echo "3. Creando Base de Datos, Usuario y Tabla..."
# Ejecutamos comandos SQL inyectándolos directamente en el gestor.
# Esto crea la BBDD, el usuario con sus permisos y la tabla para la app.
mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS lamp_db CHARSET utf8mb4;
CREATE USER 'lamp_user'@'%' IDENTIFIED BY 'lamp_password';
GRANT ALL PRIVILEGES ON lamp_db.* TO 'lamp_user'@'%';
USE lamp_db;
CREATE TABLE users (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  age INT UNSIGNED NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
EOF

echo "4. Eliminando salida a Internet..."
# Borramos la ruta de red por defecto hacia la interfaz NAT.
# Esto corta la salida a Internet, dejando a la máquina accesible SOLO por la red interna.
ip route del default dev eth0

echo "Servidor de Base de Datos aprovisionado correctamente."