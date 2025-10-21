FROM yiisoftware/yii2-php:8.1-apache

# Configurar Apache para FRONTEND
RUN sed -i -e 's|/app/web|/app/frontend/web|g' /etc/apache2/sites-available/000-default.conf

COPY . /app/
WORKDIR /app
RUN composer install --no-dev --prefer-dist --optimize-autoloader
RUN chmod -R 755 /app/frontend/web/assets
RUN chmod -R 755 /app/backend/web/assets
EXPOSE 80