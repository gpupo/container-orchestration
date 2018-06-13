FROM gpupo/container-orchestration:nginx-core-v1.1

COPY default.conf /etc/nginx/conf.d/
COPY nginxSetUpstream /bin/nginxSetUpstream

RUN /bin/nginxSetUpstream php;
