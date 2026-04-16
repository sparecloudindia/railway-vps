FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# 1. Update & Essential tools only (குறைவான நேரம் எடுக்கும்)
RUN apt-get update && apt-get install -y \
    curl ca-certificates gnupg lsb-release git tar unzip nginx supervisor

# 2. MariaDB & Redis மட்டும்
RUN apt-get install -y mariadb-server redis-server

# 3. PHP 8.1 - இதற்கென தனியாக ஒரு லேயர்
RUN apt-get install -y php8.1-fpm php8.1-cli php8.1-mysql php8.1-gd \
    php8.1-mbstring php8.1-bcmath php8.1-xml php8.1-curl php8.1-zip

# 4. Pterodactyl Files (Wings-ஐ இப்போதைக்குத் தவிர்க்கவும், Panel மட்டும் முதலில் வரட்டும்)
WORKDIR /var/www/pterodactyl
RUN curl -Lo panel.tar.gz https://github.com \
    && tar -xzvf panel.tar.gz \
    && chmod -R 755 storage/* bootstrap/cache/

EXPOSE 80

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
