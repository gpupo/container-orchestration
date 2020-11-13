#!/usr/bin/env bash

printf "\n>> PHP DEV Env \n";

if env | grep -q PHP_XDEBUG_REMOTE_HOST
then
  printf "\n>>>> Enabling xdebug\n";
  mkdir -p /var/www/app/var/log;
  cat /root/xdebug.ini | \
  sed "s/{{REMOTE_HOST}}/${PHP_XDEBUG_REMOTE_HOST}/g" \
  > /usr/local/etc/php/conf.d/xdebug.ini;
fi

php-fpm;
