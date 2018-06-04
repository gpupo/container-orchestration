FROM php:7.2-fpm

RUN apt-get -q update; \
    apt-get -q install -y git unzip zlib1g-dev libpng-dev; \
    apt-get -q install -y curl libmcrypt-dev mysql-client libicu-dev; \
    apt-get -q install -y libcurl4-openssl-dev; \
    docker-php-ext-configure intl; \
    docker-php-ext-install intl; \
    docker-php-ext-install zip pdo pdo_mysql pdo_sqlite; \
    docker-php-ext-install mbstring;\
    pecl install apcu && docker-php-ext-enable apcu; \
    docker-php-ext-install gd opcache ctype curl json spl xml bcmath mbstring reflection simplexml; \

WORKDIR /var/www/app

EXPOSE 9000
