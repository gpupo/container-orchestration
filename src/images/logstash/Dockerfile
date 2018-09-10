# https://github.com/elastic/logstash-docker
ARG ELK_VERSION
ARG CO_VERSION
FROM docker.elastic.co/logstash/logstash-oss:${ELK_VERSION}

USER root
RUN yum install sudo nmap-ncat telnet wget -y; usermod -aG wheel logstash; echo "logstash:docker" | chpasswd
USER logstash

# Add your logstash plugins setup here
# See https://www.elastic.co/guide/en/logstash/current/input-plugins.html
RUN logstash-plugin install logstash-filter-json; \
    logstash-plugin install logstash-input-gelf; \
    logstash-plugin install logstash-input-tcp; \
    logstash-plugin install logstash-input-rabbitmq; \
    logstash-plugin install logstash-input-syslog; \
    logstash-plugin install logstash-filter-geoip; \
    logstash-plugin install --version 3.2.0 logstash-filter-mutate

RUN wget http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz; gunzip GeoLite2-City.mmdb.gz; mv GeoLite2-City.mmdb data/;

LABEL org.label-schema.vcs-url="https://github.com/gpupo/container-orchestration.git" \
      org.label-schema.schema-version="${CO_VERSION}" \
      org.label-schema.vendor="gpupo" \
      org.label-schema.name="container-orchestration" \
      org.label-schema.description="Image with Logstash" \
      org.label-schema.url="https://github.com/gpupo/container-orchestration"

EXPOSE 12201/udp
EXPOSE 12202/udp
