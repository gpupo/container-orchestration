# container-orchestration

Container-orchestration sets for automating deployment, scaling and management of containerized clusters

[![Build Status](https://secure.travis-ci.org/gpupo/container-orchestration.png?branch=master)](http://travis-ci.org/gpupo/container-orchestration)


## Hello World with docker-compose (slowest)

    git clone https://github.com/gpupo/container-orchestration.git;
    cd container-orchestration;
    docker-compose up -d nginx php;

Get the ``/etc/hosts`` line:

    echo $(docker network inspect container-orchestration_frontend | grep Gateway | grep -o -E '[0-9\.]+') "container-orchestration-app.localhost"

Put your code on ./shared/

## Hello World with minikube

- Install [minikube](https://github.com/kubernetes/minikube)

    minikube start --vm-driver=hyperkit
    kubectl apply -f src/kubernetes/nginx.yaml
    minikube service nginx-service --url

# Urls & Ports

    * [Webserver](http://container-orchestration-app.localhost)
    * PHP-FPM port 9000
    * [Kibana](http://container-orchestration-app.localhost:8080)


## Development

### Update Images

    docker-composer build && docker push gpupo/container-orchestration
