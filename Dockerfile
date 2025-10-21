FROM composer:2.8 as builder

WORKDIR /app
COPY . .
RUN composer install --no-dev --prefer-dist --optimize-autoloader

FROM php:8.1-cli

COPY --from=builder /app /app
WORKDIR /app

CMD php -S 0.0.0.0:$PORT -t frontend/web