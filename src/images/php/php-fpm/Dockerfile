ARG PHP_VERSION
ARG CO_VERSION
ARG BUILD_DATE
ARG VCS_REF

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
LABEL org.label-schema.version=$CO_VERSION
LABEL org.label-schema.docker.cmd="docker run -v "$PWD":/var/www/app gpupo/container-orchestration:php-fpm"

COPY ./co-configure /usr/local/bin/co-configure

COPY php.ini /usr/local/etc/php/
COPY www.conf /usr/local/etc/php-fpm.d/www.conf
COPY opcache-recommended.ini /usr/local/etc/php/conf.d/opcache-recommended.ini
COPY .bashrc /root/

COPY entrypoint.sh /etc/entrypoint.sh



RUN mkdir -p /var/tmp/nginx && chown -R www-data:www-data /var/tmp/nginx/

RUN mkdir -p /var/lib/nginx/tmp/client_body /var/log/nginx \
    && chown -R www-data:www-data /var/lib/nginx /var/log/nginx \
    && chmod -R 775 /var/lib/nginx /var/log/nginx



RUN printf "Default modules:\n"; php -m
RUN /usr/local/bin/co-configure/run.sh
RUN printf "Final modules:\n"; php -m
COPY ./default /etc/nginx/sites-available/default
COPY ./upstream.conf /etc/nginx/sites-enabled/upstream.conf
ENTRYPOINT ["/etc/entrypoint.sh"]
WORKDIR /var/www/app
EXPOSE 80


