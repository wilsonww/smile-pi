#!/usr/bin/env bash

sudo rm -rf /usr/share/nginx/html/phet_es

cd

echo "download PhET (Español)"
git clone https://github.com/smile-pi/phet_es

echo "move PhET (Español) to nginx"
sudo mv phet_es /usr/share/nginx/html/

cd; cd -
cd ~/smile-pi
