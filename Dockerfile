FROM ubuntu:22.04

# (Non-interactive)
ENV DEBIAN_FRONTEND=noninteractive

# 1. PPA
RUN apt-get update && apt-get install -y \
    software-properties-common \
    curl \
    ca-certificates \
    gnupg \
    lsb-release \
    git \
    nginx \
    tar \
    unzip \
    supervisor \
    mariadb-server \
    redis-server

# 2. PHP 8.1
RUN add-apt-repository ppa:ondrej/php -y && apt-get update && apt-get install -y \
    php8.1-fpm php8.1-cli php8.1-mysql php8.1-gd php8.1-mbstring \
    php8.1-bcmath php8.1-xml php8.1-curl php8.1-zip

# 3. Docker
RUN curl -fsSL https://docker.com | sh

# 4. Pterodactyl Panel
WORKDIR /var/www/pterodactyl
RUN curl -Lo panel.tar.gz https://github.com \
    && tar -xzvf panel.tar.gz \
    && chmod -R 755 storage/* bootstrap/cache/

# 5. Wings (Daemon)
RUN curl -L -o /usr/local/bin/wings "https://github.com" \
    && chmod u+x /usr/local/bin/wings

# 6. Ports
EXPOSE 80 443 8080 2022

# 7. Entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
