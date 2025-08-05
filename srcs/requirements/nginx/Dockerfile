FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY conf/default.conf /etc/nginx/conf.d/default.conf

COPY tools/start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 443

CMD ["/start.sh"]
