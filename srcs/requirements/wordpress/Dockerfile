FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
    libonig-dev \
    libzip-dev \
    unzip \
    wget \
    && docker-php-ext-install mysqli \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html

RUN wget https://wordpress.org/latest.zip \
    && unzip latest.zip \
    && mv wordpress/* /var/www/html/ \
    && rm -rf wordpress latest.zip

RUN chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html

EXPOSE 9000

CMD ["php-fpm", "-F"]