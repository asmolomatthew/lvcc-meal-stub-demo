
FROM php:8.2-apache

RUN apt-get update \
    && apt-get install -y --no-install-recommends libsqlite3-dev \
    && docker-php-ext-install pdo_sqlite sqlite3 \
    && rm -rf /var/lib/apt/lists/*

RUN a2enmod rewrite

RUN printf '<Directory /var/www/html/storage>\nOptions -Indexes\nAllowOverride None\nRequire all denied\n</Directory>\n' \
    > /etc/apache2/conf-available/deny-storage.conf \
    && a2enconf deny-storage

WORKDIR /var/www/html

COPY . /var/www/html/

RUN mkdir -p /var/www/html/storage \
    && chown -R www-data:www-data /var/www/html

EXPOSE 80
