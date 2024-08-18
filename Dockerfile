# Usa una imagen base de PHP
FROM php:8.1-apache

# Configura el directorio de trabajo en el contenedor
WORKDIR /var/www/html

# Copia los archivos de la práctica al contenedor
COPY . /var/www/html

# Exponer el puerto 80 para acceder al servidor web
EXPOSE 80