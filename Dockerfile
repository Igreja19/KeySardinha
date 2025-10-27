# --- ESTÁGIO 1: Builder (Instalar dependências) ---
# Usamos a imagem oficial do Composer para instalar as dependências
FROM composer:2.8 as builder

# Definimos o diretório de trabalho
WORKDIR /app

# Copiamos TUDO do teu repositório para o container
COPY . .

# Instalamos as dependências do Composer para produção
RUN composer install --no-interaction --no-dev --optimize-autoloader

# --- ESTÁGIO 2: Produção (Servidor Apache) ---
# Usamos a imagem oficial do Yii2 com Apache e PHP 8.1
# Esta imagem JÁ TEM as extensões pdo e pdo_mysql
FROM yiisoftware/yii2-php:8.1-apache

# Copiamos os ficheiros da aplicação E a pasta 'vendor' (do estágio 'builder')
COPY --from=builder /app /app

# Corrigimos o DocumentRoot do Apache para apontar para /app/frontend/web
# Esta era a linha que faltava no teu primeiro erro 403
RUN sed -i -e 's|/app/web|/app/frontend/web|g' /etc/apache2/sites-available/000-default.conf

# (Não precisas de CMD, a imagem base 'yiisoftware/yii2-php:8.1-apache' já inicia o Apache automaticamente) 