FROM gpupo/container-orchestration:nginx-core-v1.1

COPY default.conf /etc/nginx/conf.d/
COPY nginxUpstream /bin/nginxUpstream

CMD ["sh", "-c", "nginxUpstream; nginx"]
