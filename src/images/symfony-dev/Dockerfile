ARG CO_VERSION
ARG PHP_VERSION
FROM gpupo/container-orchestration:php-dev-${CO_VERSION}

# Labels.
LABEL org.label-schema.name="gpupo/container-orchestration:symfony-dev"
LABEL org.label-schema.description="Image with PHP ${PHP_VERSION} FPM and Debian, Development tools and Yarn/Webpack for SF4 Development"
LABEL org.label-schema.docker.cmd="docker run -v "$PWD":/var/www/app gpupo/container-orchestration:symfony-dev"

RUN apt-get install -y gcc g++ make gnupg2; curl -sL https://deb.nodesource.com/setup_6.x | bash - ; \
    apt-get install -y nodejs; \
    curl --compressed -o- -L https://yarnpkg.com/install.sh | bash;


RUN echo 'export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"' >> /root/.bashrc;
