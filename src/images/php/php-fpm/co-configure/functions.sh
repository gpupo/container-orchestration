#!/bin/bash

touch /tmp/docker-compose-buid-php.log;

function_print_banner() {
  printf "\n\n====|| $1 ||======\n\n";
}

function_docker-php-ext-enable() {
  for ext in "$@"; do
      function_print_banner "ENABLE php extension: $ext"
      docker-php-ext-enable $ext >> /tmp/docker-compose-buid-php.log;
  done
}

function_docker-php-ext-install() {
  for ext in "$@"; do
      function_print_banner "INSTALL php extension: $ext"
      docker-php-ext-install $ext >> /tmp/docker-compose-buid-php.log;
  done
}

function_docker-php-ext-configure() {
  for ext in "$@"; do
      function_print_banner "CONFIGURE php extension: $ext"
      docker-php-ext-configure $ext >> /tmp/docker-compose-buid-php.log;
  done
}

function_pecl_install() {
  if [ -f /usr/local/bin/pecl ]; then
    for lib in "$@"; do
        function_print_banner "PECL INSTALL: $lib"
        printf "\n" | pecl install $lib >> /tmp/docker-compose-buid-php.log;
    done
  else
    function_pickle_install "$@"
  fi  
}
function_pickle_install() {
  for lib in "$@"; do
      function_print_banner "Pickle INSTALL: $lib"
      pickle -q install $lib >> /tmp/docker-compose-buid-php.log;
  done
}

function_end_build() {
  function_print_banner "Clear docker php source";
  rm -rf /tmp/*
  docker-php-source delete;
}
