# https://github.com/elastic/elasticsearch-docker
ARG ELK_VERSION
ARG CO_VERSION

FROM docker.elastic.co/elasticsearch/elasticsearch-oss:${ELK_VERSION}

LABEL org.label-schema.vcs-url="https://github.com/gpupo/container-orchestration.git" \
      org.label-schema.schema-version="${CO_VERSION}" \
      org.label-schema.vendor="gpupo" \
      org.label-schema.name="container-orchestration" \
      org.label-schema.description="Image with Elastic Search" \
      org.label-schema.url="https://github.com/gpupo/container-orchestration"
