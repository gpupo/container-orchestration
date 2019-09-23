#!/bin/bash

function_print_banner() {
  printf "\n\n.........\n\n\n\n====||$1||======\n\n";
}

function_docker-php-ext-install() {
  for ext in "$@"; do
      function_print_banner "INSTALL $ext"
      docker-php-ext-install $ext >> /tmp/docker-php-ext-install.log;
  done
}

function_docker-php-ext-configure() {
  for ext in "$@"; do
      function_print_banner "INSTALL $ext"
      docker-php-ext-configure $ext >> /tmp/docker-php-ext-install.log;
  done
}

function_print_banner "TOOLS";
cat /etc/os-release && \
    set -ex; apt-get -q update; apt-get install -y --no-install-recommends apt-utils iputils-ping procps && \
    apt-get -q install -y git unzip zlib1g-dev libpng-dev libjpeg-dev gettext-base libxml2-dev libzip-dev && \
    apt-get -q install -y curl libmcrypt-dev default-mysql-client libicu-dev;
