FROM php:8.3-cli

RUN apt-get update -y && apt-get install -y \
    openssl \
    zip \
    unzip \
    git \
    curl \
    libonig-dev \
    libssl-dev \
    zlib1g-dev \
    libzip-dev \
    && rm -rf /var/lib/apt/lists/*

# Install faster using install-php-extensions script
ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN install-php-extensions pdo pdo_mysql mbstring zip bcmath pcntl sockets redis

COPY --from=composer:2.7 /usr/bin/composer /usr/bin/composer

WORKDIR /app
COPY . .

RUN composer install --no-interaction --prefer-dist --optimize-autoloader \
    --ignore-platform-req=ext-sockets

CMD ["php", "artisan", "queue:work", "rabbitmq", \
     "--queue=email.queue", "--sleep=3", "--tries=3", "--timeout=90"]
