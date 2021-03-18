# container-orchestration

Container-orchestration sets for automating deployment, scaling and management of containerized clusters

[![Buil Docker Images at tag creation](https://github.com/gpupo/container-orchestration/actions/workflows/docker-hub.yaml/badge.svg)](https://github.com/gpupo/container-orchestration/actions/workflows/docker-hub.yaml)

[![Docker Pulls](https://img.shields.io/docker/pulls/gpupo/container-orchestration.svg?style=for-the-badge)](https://hub.docker.com/r/gpupo/container-orchestration/)

## Requirements
- Docker

## Use images only with Docker

Python

    docker run -v "$PWD":/usr/src/app -it --entrypoint /bin/bash \
	gpupo/container-orchestration:python-dev

PHP

	docker run -v "$PWD":/var/www/app -it --entrypoint /bin/bash \
	gpupo/container-orchestration:php-dev

To run  `Symfony 5`, create th `docker-compose.yaml` file with content:

```YAML

version: '2'
services:
    php:
        container_name: php
        image: gpupo/container-orchestration:php-fpm
        volumes:
            - ./:/var/www/app
        networks:
            - backend
    nginx-upstream:
        container_name: nginx-upstream
        image: gpupo/container-orchestration:nginx-upstream
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

  	docker run -d gpupo/container-orchestration:php-dev

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

#### OSX upload workaround

	docker login -u gpupo -p ******** docker.io && docker push gpupo/container-orchestration
