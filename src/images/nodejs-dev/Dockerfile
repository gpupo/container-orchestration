#see https://github.com/nodejs/docker-node
FROM node:stretch
ARG CO_VERSION
LABEL org.label-schema.vcs-url="https://github.com/gpupo/container-orchestration.git" \
      org.label-schema.schema-version="${CO_VERSION}" \
      org.label-schema.vendor="gpupo" \
      org.label-schema.name="container-orchestration" \
      org.label-schema.description="Image with NodeJs and Debian" \
      org.label-schema.url="https://github.com/gpupo/container-orchestration"

WORKDIR /var/www/app
