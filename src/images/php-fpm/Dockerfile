FROM php:fpm
ARG CO_VERSION
# see https://hub.docker.com/_/php/
LABEL org.label-schema.vcs-url="https://github.com/gpupo/container-orchestration.git" \
      org.label-schema.schema-version="${CO_VERSION}" \
      org.label-schema.vendor="gpupo" \
      org.label-schema.name="container-orchestration" \
      org.label-schema.description="Image with PHP 7.2  FPM and Debian" \
      org.label-schema.url="https://github.com/gpupo/container-orchestration"

RUN set -ex; apt-get -q update; apt-get install -y --no-install-recommends apt-utils iputils-ping;\
    apt-get -q install -y git unzip zlib1g-dev libpng-dev libjpeg-dev gettext-base; \
    apt-get -q install -y curl libmcrypt-dev mysql-client libicu-dev; \
    apt-get -q install -y libcurl4-openssl-dev pkg-config libssl-dev telnet vim netcat; \
    docker-php-ext-configure intl; \
    docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
    docker-php-ext-install intl zip pdo pdo_mysql mbstring bcmath;\
    pecl install apcu && docker-php-ext-enable apcu;\
    pecl install mongodb && docker-php-ext-enable mongodb;

RUN pecl install redis && docker-php-ext-enable redis;

RUN docker-php-ext-install gd  mysqli opcache ctype json mbstring; \
  usermod --shell /bin/bash www-data; \
  usermod --home /var/www/app www-data; \
  useradd -u 1001 -M docker; \
  usermod -a -G docker www-data; \
  usermod -a -G www-data docker; \
  useradd -u 1000 -M rkt; \
  usermod -a -G rkt www-data; \
  usermod -a -G www-data rkt;

COPY php.ini /usr/local/etc/php/
COPY opcache-recommended.ini /usr/local/etc/php/conf.d/opcache-recommended.ini

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"; \
    php composer-setup.php; \
    php -r "unlink('composer-setup.php');" \

RUN mkdir -p /usr/local/bin/;\
    mv -v composer.phar /usr/local/bin/composer; chmod +x /usr/local/bin/composer; \
    composer global require bamarni/symfony-console-autocomplete:dev-master;\
    echo '###> add by php-fpm ###' >> /root/.profile;\
    echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> /root/.profile;\
    echo 'eval "$(symfony-autocomplete --shell bash)"' >> /root/.profile;\
    echo '###< add by php-fpm build file ###' >> /root/.profile;

WORKDIR /var/www/app

EXPOSE 9000
