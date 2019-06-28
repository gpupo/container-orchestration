ARG CO_VERSION
ARG PHP_VERSION
FROM gpupo/container-orchestration:php5-fpm-${CO_VERSION}

# Labels.
LABEL org.label-schema.name="gpupo/container-orchestration:php-dev"
LABEL org.label-schema.description="Image with PHP ${PHP_VERSION} FPM and Debian, Nodejs 11, Development tools and Yarn/Webpack"
LABEL org.label-schema.docker.cmd="docker run -v "$PWD":/var/www/app gpupo/container-orchestration:php-dev"

RUN  pecl install xdebug \
    && docker-php-ext-enable xdebug; \
    apt-get install -y libxslt-dev; docker-php-ext-install xsl;\
    docker-php-ext-install xmlrpc; pecl install ast && docker-php-ext-enable ast;\
    composer global config minimum-stability dev;\
    composer global config prefer-stable true;\
    composer global require symfony/dotenv gpupo/common symfony/var-dumper symfony/finder phpspec/prophecy \
    phpunit/phpunit friendsofphp/php-cs-fixer "squizlabs/php_codesniffer=*" escapestudios/symfony2-coding-standard:3.x-dev\
    phploc/phploc;

#Install nodejs and yarn (https://github.com/nodesource/distributions#debinstall)
RUN apt-get install -y gcc g++ make gnupg2; curl -sL https://deb.nodesource.com/setup_11.x | bash - ; \
    apt-get install -y nodejs; \
    curl --compressed -o- -L https://yarnpkg.com/install.sh | bash;

RUN echo 'export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"' >> /root/.bashrc;

EXPOSE 3000
EXPOSE 3001
