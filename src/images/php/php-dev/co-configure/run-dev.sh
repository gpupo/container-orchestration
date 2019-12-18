#!/bin/bash

source /usr/local/bin/co-configure/functions.sh

function_print_banner "xdebug";
pecl install xdebug-2.7.2 && \
    docker-php-ext-enable xdebug;

apt-get install -y gcc g++ make gnupg2 libxslt-dev && \
    docker-php-ext-install xsl && \
    docker-php-ext-install xmlrpc && \
    pecl install ast && docker-php-ext-enable ast;

composer global install;

#PHPSPY
cd /root/ && \
    git clone https://github.com/adsr/phpspy.git && \
    cd phpspy && \
    apt-get -q install -y python && make && \
    mv phpspy /usr/bin/ && \
    cd .. && \
    rm -rf phpspy;

#Using NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
source /root/.bashrc;
command -v nvm;
nvm install 11.15.0;
nvm install 12.10.0;
nvm install 10.16.3
nvm install 6.17.1;

#Install yarn
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash && \
  echo 'export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"' >> /root/.bashrc;

#Extra Tools
apt-get install -y rsync

function_end_build
