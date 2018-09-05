ARG CO_VERSION
FROM jwilder/nginx-proxy

LABEL org.label-schema.vcs-url="https://github.com/gpupo/container-orchestration.git" \
      org.label-schema.schema-version="${CO_VERSION}" \
      org.label-schema.vendor="gpupo" \
      org.label-schema.name="container-orchestration" \
      org.label-schema.description="Image with NGINX proxy and HTTPS" \
      org.label-schema.url="https://github.com/gpupo/container-orchestration"

RUN wget -q https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.4.0-amd64.deb;\
    dpkg -i filebeat-6.4.0-amd64.deb; rm filebeat-6.4.0-amd64.deb;\
    unlink /var/log/nginx/access.log; touch /var/log/nginx/access.log; \
    unlink /var/log/nginx/error.log; touch /var/log/nginx/error.log; \
