ARG CO_VERSION
FROM gpupo/container-orchestration:php-dev-${CO_VERSION}

RUN apt-get install -y gcc g++ make gnupg2; curl -sL https://deb.nodesource.com/setup_6.x | bash - ; \
    apt-get install -y nodejs; \
    curl --compressed -o- -L https://yarnpkg.com/install.sh | bash; \
    echo 'export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"' >> /root/.profile;
