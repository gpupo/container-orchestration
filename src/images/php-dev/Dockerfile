ARG CO_VERSION
FROM gpupo/container-orchestration:php-fpm-${CO_VERSION}

RUN  pecl install xdebug-2.6.0 \
    && docker-php-ext-enable xdebug;

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"; \
    php composer-setup.php; \
    php -r "unlink('composer-setup.php');" \
    echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.profile

RUN mkdir -p /usr/local/bin/;   mv -v composer.phar /usr/local/bin/composer; chmod +x /usr/local/bin/composer;
RUN /usr/local/bin/composer global require friendsofphp/php-cs-fixer; \
    /usr/local/bin/composer global require "squizlabs/php_codesniffer=*"; \
    /usr/local/bin/composer global require escapestudios/symfony2-coding-standard:3.x-dev; \
    /root/.composer/vendor/bin/phpcbf --config-set installed_paths /root/.composer/vendor/escapestudios/symfony2-coding-standard
