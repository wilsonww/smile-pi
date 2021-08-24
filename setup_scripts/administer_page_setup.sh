#!/usr/bin/env bash
echo "install and configure php tools needed for the shutdown / reboot script"
echo "nginx php configurations and c installation"

sudo apt-get --yes --allow-unauthenticated install php7.3-fpm
sudo systemctl enable php7.3-fpm

sudo \cp ~/smile-pi/setup_files/nginx.conf.rpi3 /etc/nginx/nginx.conf
sudo \cp ~/smile-pi/setup_files/fastcgi-php.conf.rpi3 /etc/nginx/snippets/fastcgi-php.conf

sudo systemctl stop nginx
sudo systemctl stop php7.3-fpm

sudo systemctl start nginx
sudo systemctl start php7.3-fpm

echo "setup shutdown_php.c and reboot_php.c files"

cd /tmp
\cp ~/smile-pi/setup_files/shutdown_php.c /tmp/shutdown_php.c
\cp ~/smile-pi/setup_files/reboot_php.c /tmp/reboot_php.c

gcc -o shutdown_php shutdown_php.c
sudo mv shutdown_php /usr/local/bin/
sudo chown root:root /usr/local/bin/shutdown_php
sudo chmod 4755 /usr/local/bin/shutdown_php

gcc -o reboot_php reboot_php.c
sudo mv reboot_php /usr/local/bin/
sudo chown root:root /usr/local/bin/reboot_php
sudo chmod 4755 /usr/local/bin/reboot_php

echo "put in a php info page"
sudo \cp ~/smile-pi/setup_files/info.php /usr/share/nginx/html/info.php

echo "stop nginx and smile_backend service"
sudo systemctl stop nginx
sudo systemctl stop smile_backend

echo "start nginx and smile_backend service"
sudo systemctl start nginx
sudo systemctl start smile_backend

cd; cd -
cd ~/smile-pi