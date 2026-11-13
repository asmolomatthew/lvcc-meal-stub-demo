
FROM php:8.2-cli

# Verify SQLite support
RUN php -m | grep -qi '^pdo_sqlite$' \
    && php -m | grep -qi '^sqlite3$'

WORKDIR /var/www/html

COPY . /var/www/html/

RUN mkdir -p /var/www/html/storage

EXPOSE 8080

# Start PHP server using Railway's assigned port
CMD ["sh", "-c", "php -S 0.0.0.0:${PORT:-8080} -t /var/www/html router.php"]
