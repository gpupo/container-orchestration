ARG CO_VERSION
FROM gpupo/container-orchestration:nginx-core-${CO_VERSION}

COPY default.conf /etc/nginx/conf.d/
COPY nginxUpstream /bin/nginxUpstream

RUN chown -R www-data:www-data /var/tmp/nginx/

CMD ["sh", "-c", "nginxUpstream; nginx"]
