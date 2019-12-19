ARG PHP_VERSION
ARG CO_VERSION
ARG BUILD_DATE
ARG VCS_REF

FROM php:${PHP_VERSION}-fpm-alpine
# see https://hub.docker.com/_/php/

# Labels.
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="gpupo/container-orchestration:php-fpm-alpine"
LABEL org.label-schema.description="Image with PHP ${PHP_VERSION} FPM and Alpine"
LABEL org.label-schema.url="https://opensource.gpupo.com/container-orchestration/"
LABEL org.label-schema.vcs-url="https://github.com/gpupo/container-orchestration"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="gpupo"
LABEL org.label-schema.version=$CO_VERSION
LABEL org.label-schema.docker.cmd="docker run -v "$PWD":/var/www/app gpupo/container-orchestration:php-fpm-alpine"

RUN apk add --update curl wget busybox-extras\
    autoconf openssh-client libtool zlib-dev icu-dev g++ \
    linux-headers;

RUN apk add libssl1.1 \
    openssl-dev \
    freetype-dev \
    libpng-dev \
    libjpeg-turbo-dev \
    libmcrypt-dev

RUN     set -x                           && \
        apk update                       && \
        apk upgrade                      && \
        docker-php-source extract        && \
        apk add --no-cache                  \
            --virtual .build-dependencies   \
                $PHPIZE_DEPS                \
                cyrus-sasl-dev              \
                git                         \
                autoconf                    \
                g++                         \
                libtool                     \
                make                        \
                libgcrypt                   \
                pcre-dev

RUN apk add --no-cache                  \
            tini                            \
            libintl                         \
            icu                             \
            icu-dev                         \
            libxml2-dev                     \
            postgresql-dev                  \
            freetype-dev                    \
            libjpeg-turbo-dev               \
            libpng-dev                      \
            gmp                             \
            gmp-dev                         \
            libmemcached-dev                \
            imagemagick-dev                 \
            libzip-dev                       \
            zlib-dev                        \
            libssh2-dev                     \
            libwebp-dev                     \
            libxpm-dev                      \
            libvpx-dev                      \
            libxslt-dev                     \
            libmcrypt-dev

RUN  docker-php-ext-configure exif

RUN docker-php-ext-configure gd             \
            --with-freetype=/usr/include/       \
            --with-xpm=/usr/include/            \
            --with-webp=/usr/include/           \
            --with-jpeg=/usr/include/

RUN docker-php-ext-install intl
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install zip
RUN docker-php-ext-install soap
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install gmp
RUN docker-php-ext-install iconv
RUN docker-php-ext-install gd

RUN rm -rf /var/cache/apk/* /tmp/*;

COPY php.ini /usr/local/etc/php/
COPY opcache-recommended.ini /usr/local/etc/php/conf.d/opcache-recommended.ini
COPY .bashrc /root/

WORKDIR /var/www/app
