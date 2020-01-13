#!/bin/bash

source /usr/local/bin/co-configure/functions.sh

function_print_banner "TOOLS";
cat /etc/os-release && \
    set -ex; apt-get -q update; apt-get install -y --no-install-recommends apt-utils iputils-ping procps && \
    apt-get -q install -y git unzip zlib1g-dev libpng-dev libjpeg-dev gettext-base libxml2-dev libzip-dev && \
    apt-get -q install -y curl libmcrypt-dev default-mysql-client libicu-dev;

function_print_banner "LIBS";
apt-get -q install -y libcurl4-openssl-dev pkg-config libssl-dev telnet vim netcat libonig-dev;

function_docker-php-ext-configure intl;

function_print_banner "GD";
docker-php-ext-configure gd --with-jpeg=/usr;

function_docker-php-ext-install intl soap zip  bcmath sockets exif fileinfo pdo_mysql calendar;

# Pacotes com problemas:
# - mbstring: No package 'oniguruma' found

# Pacotes já instalados:
# - mbstring
# - pdo

function_print_banner "APC";
pecl install apcu && docker-php-ext-enable apcu &&\
    pecl install mongodb && docker-php-ext-enable mongodb && \
    pecl install redis && docker-php-ext-enable redis && \
    function_docker-php-ext-install gd  mysqli opcache ctype json xmlwriter;

function_end_build

function_print_banner "Configure unix user";
usermod --shell /bin/bash www-data && \
    usermod --home /var/www/app www-data && \
    useradd -u 1001 -M docker && \
    usermod -a -G docker www-data && \
    usermod -a -G www-data docker && \
    useradd -u 1000 -M rkt && \
    usermod -a -G rkt www-data && \
    usermod -a -G www-data rkt;

function_print_banner "Prepare Composer";

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'c5b9b6d368201a9db6f74e2611495f369991b72d9c8cbd3ffbc63edff210eb73d46ffbfce88669ad33695ef77dc76976') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

mv -v composer.phar /usr/local/bin/composer; chmod +x /usr/local/bin/composer;
