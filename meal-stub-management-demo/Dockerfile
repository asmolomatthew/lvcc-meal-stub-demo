
FROM php:8.2-apache

# Verify SQLite extensions
RUN php -m | grep -qi '^pdo_sqlite$' \
    && php -m | grep -qi '^sqlite3$'

# Enable only Apache prefork MPM
RUN a2dismod mpm_event || true
RUN a2dismod mpm_worker || true
RUN a2enmod mpm_prefork rewrite

# Protect SQLite storage from public access
RUN printf '<Directory /var/www/html/storage>\nOptions -Indexes\nAllowOverride None\nRequire all denied\n</Directory>\n' \
    > /etc/apache2/conf-available/deny-storage.conf \
    && a2enconf deny-storage

WORKDIR /var/www/html

COPY . /var/www/html/

RUN mkdir -p /var/www/html/storage \
    && chown -R www-data:www-data /var/www/html

EXPOSE 80
