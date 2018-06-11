# container-orchestration

Container-orchestration sets for automating deployment, scaling and management of containerized clusters

[![Build Status](https://secure.travis-ci.org/gpupo/container-orchestration.png?branch=master)](http://travis-ci.org/gpupo/container-orchestration)


## Hello World with docker-compose (slowest)

    git clone https://github.com/gpupo/container-orchestration.git;
    cd container-orchestration;
    docker-compose up -d nginx php;

Get the ``/etc/hosts`` line:

    printf "# add to /etc/hosts:\n$(docker network inspect container-orchestration_frontend | grep Gateway | grep -o -E '[0-9\.]+') container-orchestration-app.localhost"

Put your code on ./shared/

## Hello World with minikube

- Install [minikube](https://github.com/kubernetes/minikube)


Run

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


# Urls & Ports

* [Webserver](http://container-orchestration-app.localhost)
* PHP-FPM port 9000
* [Kibana](http://container-orchestration-app.localhost:8080)


## Rebuild

    minikube stop
    minikube delete


## Development

### Update Images

    docker-compose build && docker push gpupo/container-orchestration
