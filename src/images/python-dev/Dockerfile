#see https://hub.docker.com/_/python/
FROM python:3.7.0-stretch
ARG CO_VERSION
LABEL org.label-schema.vcs-url="https://github.com/gpupo/container-orchestration.git" \
      org.label-schema.schema-version="${CO_VERSION}" \
      org.label-schema.vendor="gpupo" \
      org.label-schema.name="container-orchestration" \
      org.label-schema.description="Image with Python and Debian" \
      org.label-schema.url="https://github.com/gpupo/container-orchestration"

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
