FROM php:7.4-fpm

RUN docker-php-ext-install pdo pdo_mysql

RUN apt-get update && apt-get install -y \
git \
curl \
libfontconfig1-dev \
xclip \
libjpeg62 \
libonig-dev \
libxml2-dev \
zip \
unzip \
&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-webp-dir=/usr/include/  --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install gd pdo pdo_mysql pdo_sqlite zip gmp bcmath pcntl ldap sysvmsg exif \
&& a2enmod rewrite