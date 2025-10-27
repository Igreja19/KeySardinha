# --- ESTÁGIO 1: Builder (Instalar dependências) ---
FROM composer:2.8 as builder
WORKDIR /app
COPY . .
RUN composer install --no-interaction --no-dev --optimize-autoloader

# --- ESTÁGIO 2: Produção (Servidor Apache) ---
FROM yiisoftware/yii2-php:8.1-apache
WORKDIR /app

# --- IMPORTANTE: ESTA É A LINHA QUE ESTÁ A FALTAR ---
# Copia TUDO (código, pasta vendor, etc.) do estágio 1 para este estágio
COPY --from=builder /app /app

# Corrigimos o DocumentRoot do Apache
RUN sed -i -e 's|/app/web|/app/frontend/web|g' /etc/apache2/sites-available/000-default.conf

# --- CORREÇÃO DE PERMISSÕES ---
# Dá permissão de execução ao script yii
RUN chmod +x /app/yii

# Cria os diretórios necessários e define 'www-data' como dono
RUN mkdir -p /app/frontend/runtime \
             /app/frontend/web/assets \
             /app/backend/runtime \
             /app/backend/web/assets \
             /app/console/runtime \
    && chown -R www-data:www-data /app/frontend/runtime \
                                /app/frontend/web/assets \
                                /app/backend/runtime \
                                /app/backend/web/assets \
                                /app/console/runtime