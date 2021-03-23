ARG CO_VERSION
ARG PHP_VERSION
FROM gpupo/container-orchestration:php-fpm-${CO_VERSION}

# Labels.
LABEL org.label-schema.name="gpupo/container-orchestration:php-supervisor"
LABEL org.label-schema.description="Image with PHP ${PHP_VERSION} FPM and Debian, and supervisord.org"
LABEL org.label-schema.docker.cmd="docker run -v "$PWD":/var/www/app gpupo/container-orchestration:php-supervisor"

COPY ./supervisord-custom.conf ./supervisord-custom.conf
COPY ./co-configure/run-supervisor.sh /usr/local/bin/co-configure/run-supervisor.sh
RUN /usr/local/bin/co-configure/run-supervisor.sh


#Scripts
COPY root/* /root/
RUN chmod +x /root/*.sh
CMD /root/cmd.sh
