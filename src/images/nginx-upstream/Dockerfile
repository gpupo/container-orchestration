ARG CO_VERSION
FROM gpupo/container-orchestration:nginx-core-${CO_VERSION}

COPY default.conf /etc/nginx/conf.d/
COPY nginxUpstream /bin/nginxUpstream

RUN mkdir -p /var/tmp/nginx && chown -R www-data:www-data /var/tmp/nginx/

RUN mkdir -p /var/lib/nginx/tmp/client_body /var/log/nginx \
    && chown -R www-data:www-data /var/lib/nginx /var/log/nginx \
    && chmod -R 775 /var/lib/nginx /var/log/nginx

CMD ["sh", "-c", "nginxUpstream; nginx"]
