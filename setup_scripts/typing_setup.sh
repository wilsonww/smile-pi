#!/usr/bin/env bash

sudo rm -rf /usr/share/nginx/html/open10fingers

cd

echo "download open10fingers typing"
git clone https://github.com/smile-pi/open10fingers

echo "move open10fingers to nginx"
sudo mv open10fingers /usr/share/nginx/html/
sudo cp ~/smile-pi/portal_data_files/open10fingers.txt /usr/share/nginx/html/open10fingers/portal_data.txt
sudo cp ~/smile-pi/portal_data_files/open10fingers-typing.png /usr/share/nginx/html/open10fingers/

cd; cd -
cd ~/smile-pi
