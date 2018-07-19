# container-orchestration

Container-orchestration sets for automating deployment, scaling and management of containerized clusters

[![Build Status](https://secure.travis-ci.org/gpupo/container-orchestration.png?branch=master)](http://travis-ci.org/gpupo/container-orchestration)

## Requirements

- Install [minikube](https://github.com/kubernetes/minikube)


## Use as composer dependence

    composer require gpupo/container-orchestration


Create (and customize) a `.container-orcherstration.yaml` file in project root folder:

    cp vendor/gpupo/container-orcherstration/.container-orcherstration.dist.yaml .container-orcherstration.yaml


## Use images only with Docker


To run  `Symfony 4`, create th `docker-compose.yaml` file with content:

```YAML

version: '2'
services:
    php:
        container_name: php
        image: gpupo/container-orchestration:php-fpm-latest
        volumes:
            - ./:/var/www/app
        networks:
            - backend
    nginx-upstream:
        container_name: nginx-upstream
        image: gpupo/container-orchestration:nginx-upstream-latest
        ports:
            - "80:80"
        links:
            - php
        volumes:
            - ./:/var/www/app
        networks:
            - frontend
            - backend
networks:
    frontend:
    backend:
```

and run

    docker-compose up -d


or simple run:


  docker run -d gpupo/container-orchestration:php-dev-v1.4.8



## Use as minikube asset

    git clone https://github.com/gpupo/container-orchestration.git;

    cd container-orchestration;

    ./bin/start

Put your code on `./var/app/public`


## Hello World with minikube

    minikube start

    kubectl create -f src/kubernetes/simple/nginx.yaml

    minikube service nginx-service --url


## Hello World with Ingress

    minikube start

    minikube addons enable ingress

    eval $(minikube docker-env)

    printf "# add to /etc/hosts:\n$(minikube ip) ingress.localhost\n"

    kubectl create -f src/kubernetes/ingress/simple-app.yaml

    curl http://ingress.localhost


## PHP + Ingress with Ingress

    minikube start --mount-string="./var:/tmp/shared";

    kubectl create -f build/nginx-php.yaml

    curl http://ingress.localhost


## Configure https and dh-param

    kubectl create secret tls tls-certificate --key ssl/server.key --cert ssl/server.crt
    kubectl create secret generic tls-dhparam --from-file=ssl/dhparam.pem
    kubectl create -f src/kubernetes/experimental/nginx-controller.yaml


## Development

### Update Images

    bin/build-images
