FROM yiisoftware/yii2-php:8.1-apache

# Copiar PRIMEIRO o código
COPY . /app/

WORKDIR /app

# VERIFICAR se os ficheiros foram copiados (debug)
RUN echo "=== Verificando ficheiros frontend/web/ ===" && ls -la /app/frontend/web/
RUN echo "=== Verificando ficheiros backend/web/ ===" && ls -la /app/backend/web/

# DEPOIS mudar o document root
RUN sed -i -e 's|/app/web|/app/frontend/web|g' /etc/apache2/sites-available/000-default.conf

# Instalar dependências
RUN composer install --no-dev --prefer-dist --optimize-autoloader

# Permissões
RUN chmod -R 755 /app/backend/web/assets
RUN chmod -R 755 /app/frontend/web/assets

EXPOSE 80