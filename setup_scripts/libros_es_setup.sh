#!/usr/bin/env bash

sudo rm -rf /usr/share/nginx/html/libros_es

cd

echo "download Libros (Español)"
git clone https://github.com/smile-pi/libros_es

echo "move Libros (Español) to nginx"
sudo mv libros_es /usr/share/nginx/html/

cd; cd -
cd ~/smile-pi
