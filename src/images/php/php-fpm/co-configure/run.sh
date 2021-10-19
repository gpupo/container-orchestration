#!/usr/bin/env bash

source /usr/local/bin/co-configure/functions.sh

function_print_banner "TOOLS";
cat /etc/os-release && \
    set -e; apt  update; apt install -y --no-install-recommends apt-utils iputils-ping procps && \
    apt install  -y git unzip zlib1g-dev libpng-dev libjpeg-dev gettext-base libxml2-dev libzip-dev && \
    apt install  -y curl wget libmcrypt-dev default-mysql-client libicu-dev libpq-dev;

function_print_banner "GIT CONFIG";
git config --global user.email "php-fpm@docker.noreply.internal"
git config --global user.name "PHP FPM Docker Instance"

function_print_banner "LIBS";
apt install -y libcurl4-openssl-dev pkg-config libssl-dev telnet vim netcat libonig-dev librabbitmq-dev;

function_print_banner "Pickle";
wget -q https://github.com/FriendsOfPHP/pickle/releases/latest/download/pickle.phar && chmod +x pickle.phar && mv pickle.phar /usr/local/bin/pickle;



# Default modules:
#   Core
#   ctype
#   curl
#   date
#   dom
#   fileinfo
#   filter
#   ftp
#   hash
#   iconv
#   json
#   libxml
#   mbstring
#   mysqlnd
#   openssl
#   pcre
#   PDO
#   pdo_sqlite
#   Phar
#   posix
#   readline
#   Reflection
#   session
#   SimpleXML
#   sodium
#   SPL
#   sqlite3
#   standard
#   tokenizer
#   xml
#   xmlreader
#   xmlwriter
#   zlib


function_print_banner "INTL"
function_docker-php-ext-configure intl

function_print_banner "GD"
docker-php-ext-configure gd --with-jpeg=/usr;

# Possible values for ext-name:
#   bcmath bz2 calendar ctype curl dba dom enchant exif ffi fileinfo filter ftp gd gettext gmp hash 
#   iconv imap intl json ldap mbstring mysqli oci8 odbc opcache pcntl pdo pdo_dblib pdo_firebird 
#   pdo_mysql pdo_oci pdo_odbc pdo_pgsql pdo_sqlite pgsql phar posix pspell readline reflection session 
#   shmop simplexml snmp soap sockets sodium spl standard sysvmsg sysvsem sysvshm tidy tokenizer xml xmlreader 
#   xmlwriter xsl zend_test zip

function_docker-php-ext-install intl soap zip bcmath sockets exif pdo_mysql pdo_pgsql calendar;

function_print_banner "APC";
function_pecl_install apcu && function_docker-php-ext-enable apcu;

function_print_banner "PECL MODULES";
function_pecl_install mongodb && function_docker-php-ext-enable mongodb && \
function_pecl_install redis && function_docker-php-ext-enable redis;

function_print_banner "EXT MODULES"
function_docker-php-ext-install gd mysqli opcache;

function_print_banner "AMQP";
function_pecl_install amqp && \
function_docker-php-ext-enable amqp;

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
# https://getcomposer.org/download/
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv -v composer.phar /usr/local/bin/composer; chmod +x /usr/local/bin/composer;

#INFO
php -i | grep version > ~/php-module-versions;