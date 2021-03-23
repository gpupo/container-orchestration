#!/usr/bin/env bash

printf "\n>> Supervisor Env \n";
service supervisor start;

printf "\n>> PHP Env \n";
php-fpm;




