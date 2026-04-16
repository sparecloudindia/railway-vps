#!/bin/bash

service ssh start
service mysql start
service redis-server start
service nginx start
service php8.1-fpm start

clear
neofetch
echo "----------------------------------------------------"
echo "🚀 ULTIMATE UBUNTU VPS IS NOW ONLINE!"
echo "----------------------------------------------------"
echo "USER     : root"
echo "PASSWORD : root"
echo "ACCESS   : Railway Terminal or SSH (if configured)"
echo "----------------------------------------------------"

# கண்டெய்னர் ஆஃப் ஆகாமல் இருக்க
tail -f /dev/null
