# https://github.com/elastic/logstash-docker
FROM docker.elastic.co/logstash/logstash-oss:6.2.3

# Add your logstash plugins setup here
RUN logstash-plugin install logstash-filter-json

LABEL org.label-schema.vcs-url="https://github.com/gpupo/container-orchestration.git" \
      org.label-schema.schema-version="${CO_VERSION}" \
      org.label-schema.vendor="gpupo" \
      org.label-schema.name="container-orchestration" \
      org.label-schema.description="Image with Logstash" \
      org.label-schema.url="https://github.com/gpupo/container-orchestration"

EXPOSE 12201
