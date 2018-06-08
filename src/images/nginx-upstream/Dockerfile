FROM gpupo/container-orchestration:nginx-core-latest

ADD app.conf /etc/nginx/conf.d/

RUN echo "upstream php-upstream { server php.default:9000; }" > /etc/nginx/conf.d/upstream.conf;
