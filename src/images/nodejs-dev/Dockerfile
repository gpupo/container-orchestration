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

RUN curl --compressed -o- -L https://yarnpkg.com/install.sh | bash; \
    echo 'export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"' >> /root/.bashrc;
