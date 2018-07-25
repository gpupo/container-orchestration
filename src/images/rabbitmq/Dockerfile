ARG CO_VERSION
FROM rabbitmq:3-management

LABEL org.label-schema.vcs-url="https://github.com/gpupo/container-orchestration.git" \
      org.label-schema.schema-version="${CO_VERSION}" \
      org.label-schema.vendor="gpupo" \
      org.label-schema.name="container-orchestration" \
      org.label-schema.description="RabbitMQ is the most widely known implementation of AMQP" \
      org.label-schema.url="https://github.com/gpupo/container-orchestration"

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
        python apt-utils iputils-ping telnet\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
