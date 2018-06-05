# container-orchestration

Container-orchestration sets for automating deployment, scaling and management of containerized clusters

[![Build Status](https://secure.travis-ci.org/gpupo/container-orchestration.png?branch=master)](http://travis-ci.org/gpupo/container-orchestration)

## Hello World

    git clone https://github.com/gpupo/container-orchestration.git;
    cd container-orchestration;
    docker-compose up -d;

Get the ``/etc/hosts`` line:

    echo $(docker network inspect container-orchestration_frontend | grep Gateway | grep -o -E '[0-9\.]+') "container-orchestration-app.localhost"

Put your code on ./shared/


# Urls & Ports

    * [Webserver](http://container-orchestration-app.localhost)
    * PHP-FPM port 9000
    * [Kibana](http://container-orchestration-app.localhost:8080)


## Development

### Update Images

    docker-composer build && docker push gpupo/container-orchestration
