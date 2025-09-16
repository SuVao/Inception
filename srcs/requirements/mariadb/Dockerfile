FROM mariadb:10.11

RUN apt-get update && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /etc/.secrets

COPY ../../secrets /etc/.secrets
