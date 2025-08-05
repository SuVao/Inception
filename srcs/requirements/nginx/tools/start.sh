#!/bin/bash
if [ ! -f /etc/nginx/ssl/server.crt ] || [ ! -f /etc/nginx/ssl/server.key ]; then
    mkdir -p /etc/nginx/ssl
    openssl req -x509 -nodes -days 365 \
      -newkey rsa:2048 \
      -keyout /etc/nginx/ssl/server.key \
      -out /etc/nginx/ssl/server.crt \
      -subj "/C=PT/ST=Lisboa/L=Lisboa/O=42/OU=42Lisboa/CN=pesilva.42.fr"
fi

echo "A iniciar o NGINX..."
nginx -g "daemon off;"