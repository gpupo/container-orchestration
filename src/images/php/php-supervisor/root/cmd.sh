#!/usr/bin/env bash

printf "\n>> Supervisor Env \n";
service supervisor start;
supervisorctl -c /etc/supervisor/supervisord.conf reread;
supervisorctl -c /etc/supervisor/supervisord.conf update;
supervisorctl -c /etc/supervisor/supervisord.conf start all;
/usr/bin/supervisord -n;

printf "\n>> PHP Env \n";
php-fpm;




