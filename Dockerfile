FROM ubuntu:22.04

# 1. அடிப்படைத் தேவைகள்
ENV DEBIAN_FRONTEND=noninteractive

# 2. VPS-க்குத் தேவையான டூல்ஸ்கள் (Network, File Manager, Security)
RUN apt-get update && apt-get install -y \
    curl ca-certificates gnupg lsb-release git sudo wget tar unzip \
    openssh-server net-tools iputils-ping screen htop neofetch \
    vim nano ufw bzip2 build-essential

# 3. Web & Database Stack (Optional but good for VPS)
RUN apt-get install -y nginx mariadb-server redis-server php8.1-fpm php8.1-cli

# 4. Root யூசர் மற்றும் பாஸ்வேர்ட் செட் செய்தல்
# Username: root | Password: root
RUN echo 'root:root' | chpasswd \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config \
    && mkdir /var/run/sshd

# 5. போர்ட்டுகள் (Web, SSH, Ptero, Wings)
EXPOSE 80 443 22 8080 2022

# 6. தொடக்க ஸ்கிரிப்ட்
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /root
ENTRYPOINT ["/entrypoint.sh"]
