FROM composer:2.8 as builder

WORKDIR /app
COPY . .
RUN composer install --no-dev --prefer-dist --optimize-autoloader

FROM php:8.1-cli

# INSTALAR EXTENSÕES MYSQL
RUN docker-php-ext-install pdo pdo_mysql

COPY --from=builder /app /app
WORKDIR /app

CMD php -S 0.0.0.0:$PORT -t frontend/web
FROM yiisoftware/yii2-php:8.1-apache

# Change document root for Apache
RUN sed -i -e 's|/app/web|/app/frontend/web|g' /etc/apache2/sites-available/000-default.conf
