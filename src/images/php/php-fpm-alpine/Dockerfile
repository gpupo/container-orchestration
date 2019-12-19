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



ARG     PHPREDIS_VERSION="${PHPREDIS_VERSION:-5.0.0}"
ENV     PHPREDIS_VERSION="${PHPREDIS_VERSION}"

ADD     https://github.com/phpredis/phpredis/archive/${PHPREDIS_VERSION}.tar.gz /tmp/

RUN apk add --update curl wget busybox-extras\
    autoconf openssh-client curl wget libtool zlib-dev icu-dev g++ \
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

# Redis
RUN tar xfz /tmp/${PHPREDIS_VERSION}.tar.gz   && \
       \
       mv phpredis-$PHPREDIS_VERSION /usr/src/php/ext/redis    && \
       \
       git clone https://github.com/php-memcached-dev/php-memcached.git /usr/src/php/ext/memcached/    && \
       \
       docker-php-ext-configure memcached


# Possible values for ext-name:
# bcmath bz2 calendar ctype curl dba dom enchant exif ffi fileinfo filter
# ftp gd gettext gmp hash iconv imap intl json ldap mbstring mysqli oci8 odbc
# opcache pcntl pdo pdo_dblib pdo_firebird pdo_mysql pdo_oci pdo_odbc pdo_pgsql]
# pdo_sqlite pgsql phar posix pspell readline reflection session shmop simplexml
# snmp soap sockets sodium spl standard sysvmsg sysvsem sysvshm tidy tokenizer
# xml xmlreader xmlrpc xmlwriter xsl zend_test zip

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
#RUN docker-php-ext-install redis
RUN docker-php-ext-install iconv
RUN docker-php-ext-install gd

#
# RUN pecl bundle -d /usr/src/php/ext redis
# RUN docker-php-ext-install -j2 redis
# RUN docker-php-ext-configure intl
# RUN docker-php-ext-install -j2 intl
# RUN pecl bundle -d /usr/src/php/ext mcrypt
# RUN docker-php-ext-configure mcrypt
# RUN pecl bundle -d /usr/src/php/ext apcu
# RUN docker-php-ext-install -j2 apcu
# RUN docker-php-ext-configure gd  --with-jpeg=/usr
#
# RUN apk add pkgconf
# RUN apk add libicu-dev
#
# RUN docker-php-ext-install -j2 bcmath gd iconv mbstring mcrypt
# RUN docker-php-ext-install -j2 zip soap sockets exif fileinfo pdo_mysql calendar
#
# RUN docker-php-ext-enable opcache
# RUN rm /usr/src/php/ext/*.tgz
# RUN pecl channel-update pecl.php.net
# RUN pecl install mongodb
# RUN docker-php-ext-enable mongodb

RUN rm -rf /var/cache/apk/* /tmp/*;

COPY php.ini /usr/local/etc/php/
COPY opcache-recommended.ini /usr/local/etc/php/conf.d/opcache-recommended.ini
COPY .bashrc /root/
WORKDIR /var/www/app

EXPOSE 9000
