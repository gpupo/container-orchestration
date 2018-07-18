FROM php:fpm
# see https://hub.docker.com/_/php/
LABEL org.label-schema.vcs-url="https://github.com/gpupo/container-orchestration.git" \
      org.label-schema.schema-version="${CO_VERSION}" \
      org.label-schema.vendor="gpupo" \
      org.label-schema.name="container-orchestration" \
      org.label-schema.description="Image with PHP 7.2 and Debian" \
      org.label-schema.url="https://github.com/gpupo/container-orchestration"

RUN set -ex; apt-get -q update; apt-get install -y --no-install-recommends apt-utils iputils-ping;\
    apt-get -q install -y git unzip zlib1g-dev libpng-dev libjpeg-dev; \
    apt-get -q install -y curl libmcrypt-dev mysql-client libicu-dev; \
    apt-get -q install -y libcurl4-openssl-dev telnet vim netcat; \
    docker-php-ext-configure intl; \
    docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
    docker-php-ext-install intl zip pdo pdo_mysql mbstring;\
    pecl install apcu && docker-php-ext-enable apcu;

RUN docker-php-ext-install gd  mysqli opcache ctype json mbstring; \
  usermod --shell /bin/bash www-data; \
  usermod --home /var/www/app www-data; \
  useradd -u 1001 -M docker; \
  usermod -a -G docker www-data; \
  usermod -a -G www-data docker; \
  useradd -u 1000 -M rkt; \
  usermod -a -G rkt www-data; \
  usermod -a -G www-data rkt;

COPY php.ini /usr/local/etc/php/
COPY opcache-recommended.ini /usr/local/etc/php/conf.d/opcache-recommended.ini

WORKDIR /var/www/app

EXPOSE 9000
