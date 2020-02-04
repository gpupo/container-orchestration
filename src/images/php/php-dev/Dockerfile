ARG CO_VERSION
ARG PHP_VERSION
FROM gpupo/container-orchestration:php-fpm-${CO_VERSION}

# Labels.
LABEL org.label-schema.name="gpupo/container-orchestration:php-dev"
LABEL org.label-schema.description="Image with PHP ${PHP_VERSION} FPM and Debian, Nodejs 11, Development tools and Yarn/Webpack for PHP Development"
LABEL org.label-schema.docker.cmd="docker run -v "$PWD":/var/www/app gpupo/container-orchestration:php-dev"

COPY root/.composer/composer.json /root/.composer/composer.json
COPY ./co-configure/run-dev.sh /usr/local/bin/co-configure/run-dev.sh
RUN /usr/local/bin/co-configure/run-dev.sh

#Scripts
COPY root/* /root/
RUN chmod +x /root/*.sh
CMD /root/cmd.sh

EXPOSE 3000
EXPOSE 3001
EXPOSE 3002
