# https://github.com/elastic/logstash-docker
ARG ELK_VERSION
ARG CO_VERSION
FROM docker.elastic.co/logstash/logstash-oss:${ELK_VERSION}

USER root

RUN yum install sudo nmap-ncat -y; usermod -aG wheel logstash; echo "logstash:docker" | chpasswd

USER logstash

# Add your logstash plugins setup here
# See https://www.elastic.co/guide/en/logstash/current/input-plugins.html
RUN logstash-plugin install logstash-filter-json; \
    logstash-plugin install logstash-input-gelf; \
    logstash-plugin install logstash-input-tcp; \
    logstash-plugin install logstash-input-syslog

LABEL org.label-schema.vcs-url="https://github.com/gpupo/container-orchestration.git" \
      org.label-schema.schema-version="${CO_VERSION}" \
      org.label-schema.vendor="gpupo" \
      org.label-schema.name="container-orchestration" \
      org.label-schema.description="Image with Logstash" \
      org.label-schema.url="https://github.com/gpupo/container-orchestration"

EXPOSE 12201/udp
EXPOSE 12202/udp
EXPOSE 5000/udp
