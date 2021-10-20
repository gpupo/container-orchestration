#!/usr/bin/env bash

source /usr/local/bin/co-configure/functions.sh

function_print_banner "xdebug";
function_pecl_install xdebug-2.7.2 && \
    function_docker-php-ext-enable xdebug;

apt-get install -q -y gcc g++ make gnupg2 libxslt-dev && \
    function_docker-php-ext-install xsl && \
    function_docker-php-ext-install xmlrpc

function_print_banner "ast";
function_pecl_install ast && function_docker-php-ext-enable ast;

function_print_banner "Composer dev packages";
cat /root/.composer/composer.json;
composer global install;

#phpcs
function_print_banner "Configure PHPCS";
~/.composer/vendor/bin/phpcs --config-set installed_paths ~/.composer/vendor/escapestudios/symfony2-coding-standard/

#PHPSPY
function_print_banner "PHPSPY";
cd /root/ && \
    git clone https://github.com/adsr/phpspy.git && \
    cd phpspy && \
    apt-get -q install -y python && make && \
    mv phpspy /usr/bin/ && \
    cd .. && \
    rm -rf phpspy;

#Using NVM
function_print_banner "NVM";
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
source /root/.bashrc;
command -v nvm;
nvm install 11.15.0;
nvm install 12.10.0;
nvm install 10.16.3
nvm install 6.17.1;

#Install yarn
function_print_banner "yarn";
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash && \
  echo 'export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"' >> /root/.bashrc;

#Extra Tools
apt-get install -q -y rsync bash-completion

function_end_build
