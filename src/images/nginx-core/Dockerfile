FROM alpine:3.10
ARG CO_VERSION
EXPOSE 80

LABEL org.label-schema.vcs-url="https://github.com/gpupo/container-orchestration.git" \
      org.label-schema.schema-version="${CO_VERSION}" \
      org.label-schema.vendor="gpupo" \
      org.label-schema.name="container-orchestration" \
      org.label-schema.description="Image with NGINX and Alpine" \
      org.label-schema.url="https://github.com/gpupo/container-orchestration"

RUN apk add --update nginx curl vim git busybox-extras;\
    rm -rf /var/cache/apk/* && rm -rf /tmp/*;

ADD nginx.conf /etc/nginx/
COPY default.conf /etc/nginx/conf.d/
COPY .bashrc /root/

RUN adduser -D -g '' -G www-data www-data;

CMD ["nginx"]

WORKDIR /var/www/app
