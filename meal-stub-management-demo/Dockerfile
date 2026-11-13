
FROM php:8.2-apache

# Confirm SQLite extensions are available
RUN php -m | grep -qi '^pdo_sqlite$' \
    && php -m | grep -qi '^sqlite3$'

# Enable Apache rewrite
RUN a2enmod rewrite

# Block direct public access to the SQLite storage folder
RUN printf '<Directory /var/www/html/storage>\nOptions -Indexes\nAllowOverride None\nRequire all denied\n</Directory>\n' \
    > /etc/apache2/conf-available/deny-storage.conf \
    && a2enconf deny-storage

WORKDIR /var/www/html

COPY . /var/www/html/

RUN mkdir -p /var/www/html/storage \
    && chown -R www-data:www-data /var/www/html

EXPOSE 80
