#!/bin/bash
mkdir -p /etc/nginx/ssl
openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/server.key \
  -out /etc/nginx/ssl/server.crt \
  -subj "/C=PT/ST=Lisboa/L=Lisboa/O=42/OU=42Lisboa/CN=pedro.42.fr"

nginx -g "daemon off;"

docker stop sleepy_antonelli
docker rm sleepy_antonelli
docker run -d -p 443:443 nginxteste
