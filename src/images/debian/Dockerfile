FROM debian:stable

RUN apt-get update \
  && apt-get -y --no-install-recommends install \
      python apt-utils iputils-ping telnet\
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
