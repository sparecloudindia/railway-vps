#!/bin/bash

# MySQL மற்றும் Redis தொடங்குதல்
service mysql start
service redis-server start
service php8.1-fpm start
service nginx start

# Docker Daemon-ஐ பின்னணியில் தொடங்க முயற்சித்தல்
# (Railway அனுமதித்தால் மட்டுமே இது வேலை செய்யும்)
dockerd --iptables=false --bridge=none &

echo "Pterodactyl Services are starting..."

# Wings-ஐத் தொடங்குதல் (கான்பிக் கோப்பு /etc/pterodactyl/config.yml அவசியம்)
if [ -f "/etc/pterodactyl/config.yml" ]; then
    /usr/local/bin/wings &
fi

# கண்டெய்னர் நின்றுவிடாமல் இருக்க லாக்ஸை காண்பித்தல்
tail -f /var/log/nginx/access.log
