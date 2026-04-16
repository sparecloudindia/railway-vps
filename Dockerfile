FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# தேவையான பேக்கேஜ்களை நிறுவுதல்
RUN apt-get update && apt-get install -y \
    curl ca-certificates gnupg lsb-release git nginx \
    php8.1-fpm php8.1-cli php8.1-mysql php8.1-gd php8.1-mbstring \
    php8.1-bcmath php8.1-xml php8.1-curl php8.1-zip \
    mariadb-server redis-server tar unzip supervisor

# Docker-ஐ நிறுவுதல் (Wings-க்கு தேவை)
RUN curl -fsSL https://docker.com | sh

# Pterodactyl Panel பதிவிறக்கம்
WORKDIR /var/www/pterodactyl
RUN curl -Lo panel.tar.gz https://github.com \
    && tar -xzvf panel.tar.gz \
    && chmod -R 755 storage/* bootstrap/cache/

# Wings (Daemon) பதிவிறக்கம்
RUN curl -L -o /usr/local/bin/wings "https://github.com" \
    && chmod u+x /usr/local/bin/wings

# Networking Ports
EXPOSE 80 443 8080 2022

# Entrypoint Script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
