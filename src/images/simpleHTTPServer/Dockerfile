FROM debian:stable

RUN apt-get update \
  && apt-get -y --no-install-recommends install \
      python \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

EXPOSE "8000"
ENTRYPOINT ["python", "-m", "SimpleHTTPServer"]
