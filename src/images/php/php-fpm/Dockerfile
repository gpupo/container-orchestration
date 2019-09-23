ARG PHP_VERSION
ARG CO_VERSION
ARG BUILD_DATE
ARG VCS_REF
ARG BUILD_VERSION

FROM php:${PHP_VERSION}-fpm
# see https://hub.docker.com/_/php/

# Labels.
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="gpupo/container-orchestration:php-fpm"
LABEL org.label-schema.description="Image with PHP ${PHP_VERSION} FPM and Debian"
LABEL org.label-schema.url="https://opensource.gpupo.com/container-orchestration/"
LABEL org.label-schema.vcs-url="https://github.com/gpupo/container-orchestration"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="gpupo"
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.docker.cmd="docker run -v "$PWD":/var/www/app gpupo/container-orchestration:php-fpm"

COPY ./co-configure /usr/local/bin/
RUN chmod +x /usr/local/bin/co-configure/*
RUN /usr/local/bin/co-configure/run.sh

COPY php.ini /usr/local/etc/php/
COPY opcache-recommended.ini /usr/local/etc/php/conf.d/opcache-recommended.ini

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"; \
    php composer-setup.php; \
    php -r "unlink('composer-setup.php');"

RUN mv -v composer.phar /usr/local/bin/composer; chmod +x /usr/local/bin/composer;

COPY .bashrc /root/

WORKDIR /var/www/app

EXPOSE 9000
