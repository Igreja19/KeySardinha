FROM yiisoftware/yii2-php:8.1-apache

# Change document root for Apache
RUN sed -i -e 's|/app/web|/app/frontend/web|g' /etc/apache2/sites-available/000-default.conf


# Copiar TODO o projeto (inclui backend, frontend, common, etc.)
COPY . /app/

WORKDIR /app

# Instalar dependências do Composer
RUN composer install --no-dev --prefer-dist --optimize-autoloader

# Configurar permissões (se necessário)
RUN chmod -R 755 /app/backend/web/assets
RUN chmod -R 755 /app/frontend/web/assets

# Expor porta
EXPOSE 80