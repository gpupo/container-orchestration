ARG CO_VERSION
FROM gpupo/container-orchestration:php-fpm-${CO_VERSION}

RUN  pecl install xdebug-2.6.0 \
    && docker-php-ext-enable xdebug;

RUN apt-get install -y libxslt-dev; docker-php-ext-install xsl; docker-php-ext-install xmlrpc;

RUN composer global config minimum-stability dev;\
    composer global config prefer-stable true;\
    composer global require symfony/dotenv symfony/var-dumper symfony/finder phpspec/prophecy \
    phpunit/phpunit:^7.2 friendsofphp/php-cs-fixer "squizlabs/php_codesniffer=*" escapestudios/symfony2-coding-standard:3.x-dev\
    phploc/phploc pdepend/pdepend phpmd/phpmd sebastian/phpcpd phpstan/phpstan maknz/slack; \
    /root/.composer/vendor/bin/phpcbf --config-set installed_paths /root/.composer/vendor/escapestudios/symfony2-coding-standard \
