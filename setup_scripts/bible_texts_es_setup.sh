#!/usr/bin/env bash

sudo rm -rf /usr/share/nginx/html/bible_es

cd

echo "download Spanish bible"
git clone https://github.com/smile-pi/bible_es

echo "move Spanish to nginx"
sudo mv bible_es /usr/share/nginx/html/

cd; cd -
cd ~/smile-pi