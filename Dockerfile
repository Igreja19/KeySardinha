FROM php:8.1-cli

COPY . /app/
WORKDIR /app
RUN composer install --no-dev --prefer-dist --optimize-autoloader

CMD php -S 0.0.0.0:$PORT -t frontend/web