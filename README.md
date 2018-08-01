# container-orchestration

Container-orchestration sets for automating deployment, scaling and management of containerized clusters

[![Build Status](https://secure.travis-ci.org/gpupo/container-orchestration.png?branch=master)](http://travis-ci.org/gpupo/container-orchestration) [![Docker Stars](https://img.shields.io/docker/stars/gpupo/container-orchestration.svg?style=for-the-badge)]() [![Docker Pulls](https://img.shields.io/docker/pulls/gpupo/container-orchestration.svg?style=for-the-badge)]()

## Requirements
- Docker
- [Minikube](https://github.com/kubernetes/minikube) (if run Kubrnetes)


## Use images only with Docker

Python

    docker run -v "$PWD":/usr/src/app -it --entrypoint /bin/bash \
	gpupo/container-orchestration:python-dev-v1.4.11;

PHP

	docker run -v "$PWD":/var/www/app -it --entrypoint /bin/bash \
	gpupo/container-orchestration:php-dev-v1.4.11

Node

	docker run -v "$PWD":/var/www/app -it --entrypoint /bin/bash \
	gpupo/container-orchestration:nodejs-dev-v1.4.11


To run  `Symfony 4`, create th `docker-compose.yaml` file with content:

```YAML

version: '2'
services:
    php:
        container_name: php
        image: gpupo/container-orchestration:php-fpm-v1.4.11
        volumes:
            - ./:/var/www/app
        networks:
            - backend
    nginx-upstream:
        container_name: nginx-upstream
        image: gpupo/container-orchestration:nginx-upstream-v1.4.11
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


  	docker run -d gpupo/container-orchestration:php-dev-v1.4.11


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

1) Clone this project;
2) Fork https://github.com/gpupo/container-orchestration;
3) Add your fork url as Remote in your local repository;
4) Create a fetature branch
5) Edit and build images;
6) Push new codes into your remote branch;
7) Create a Pull Request

### Build Images

    docker-compose build

### Upload to Docker Hub (if you have permission!)

	docker push gpupo/container-orchestration
