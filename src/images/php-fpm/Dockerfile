FROM php:fpm
# see https://hub.docker.com/_/php/
LABEL org.label-schema.vcs-url="https://github.com/gpupo/container-orchestration.git" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.vendor="gpupo" \
      org.label-schema.name="container-orchestration" \
      org.label-schema.description="Image with PHP 7.2 and Debian" \
      org.label-schema.url="https://github.com/gpupo/container-orchestration"

RUN apt-get -q update; apt-get install -y --no-install-recommends apt-utils iputils-ping;\
    apt-get -q install -y git unzip zlib1g-dev libpng-dev; \
    apt-get -q install -y curl libmcrypt-dev mysql-client libicu-dev; \
    apt-get -q install -y libcurl4-openssl-dev telnet vim; \
    docker-php-ext-configure intl; \
    docker-php-ext-install intl; \
    docker-php-ext-install zip pdo pdo_mysql pdo_sqlite; \
    docker-php-ext-install mbstring;\
    pecl install apcu && docker-php-ext-enable apcu;

RUN docker-php-ext-install gd opcache ctype json mbstring; \
  usermod --shell /bin/bash www-data;

#xml bcmath simplexml;

WORKDIR /var/www/app

EXPOSE 9000
