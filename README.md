# container-orchestration


## Hello World

    git clone https://github.com/gpupo/container-orchestration.git;
    cd container-orchestration;
    docker-compose up -d;

Get the /etc/host line:

    echo $(docker network inspect bridge | grep Gateway | grep -o -E '[0-9\.]+') "container-orchestration-app.localhost"

Put your code on ./shared/


Access (http://container-orchestration-app.localhost)[container-orchestration-app.localhost]
