#!/usr/bin/env bash

sudo rm -rf /usr/share/nginx/html/smile_paint

cd

echo "download smile paint"
git clone https://github.com/smile-pi/smile_paint

echo "move smile paint to nginx"
sudo mv smile_paint /usr/share/nginx/html/
sudo cp ~/smile-pi/portal_data_files/edify_draw_and_paint.txt /usr/share/nginx/html/smile_paint/portal_data.txt
sudo cp ~/smile-pi/portal_data_files/edify-draw-and-paint.png /usr/share/nginx/html/smile_paint/

cd; cd -
cd ~/smile-pi
