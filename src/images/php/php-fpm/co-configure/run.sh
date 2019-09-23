#!/bin/bash

source /usr/local/bin/co-configure/functions.sh

function_print_banner "LIBS";
apt-get -q install -y libcurl4-openssl-dev pkg-config libssl-dev telnet vim netcat;

function_docker-php-ext-configure intl;

function_print_banner "GD";
docker-php-ext-configure gd --with-jpeg=/usr;

function_docker-php-ext-install intl soap zip  bcmath sockets exif fileinfo pdo pdo_mysql calendar;

# Pacotes com problemas:
# - mbstring: No package 'oniguruma' found


function_print_banner "APC";
pecl install apcu && docker-php-ext-enable apcu &&\
    pecl install mongodb && docker-php-ext-enable mongodb && \
    pecl install redis && docker-php-ext-enable redis && \
    function_docker-php-ext-install gd  mysqli opcache ctype json;
function_print_banner "USER";

usermod --shell /bin/bash www-data && \
    usermod --home /var/www/app www-data && \
    useradd -u 1001 -M docker && \
    usermod -a -G docker www-data && \
    usermod -a -G www-data docker && \
    useradd -u 1000 -M rkt && \
    usermod -a -G rkt www-data && \
    usermod -a -G www-data rkt;
