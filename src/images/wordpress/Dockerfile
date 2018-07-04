FROM wordpress:php7.2-fpm

RUN apt-get -q update; apt-get install -y --no-install-recommends apt-utils iputils-ping;\
    apt-get -q install -y git unzip zlib1g-dev libpng-dev; \
    apt-get -q install -y curl libmcrypt-dev mysql-client libicu-dev; \
    apt-get -q install -y libcurl4-openssl-dev telnet vim;

COPY docker-entrypoint.sh /usr/local/bin/
