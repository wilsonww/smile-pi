#!/usr/bin/env bash

# sudo apt edit-sources
# deb http://raspbian.raspberrypi.org/raspbian bullseye main contrib non-free rpi

echo "Kolibri"

sudo apt -y --allow-unauthenticated install libffi-dev python3-pip python3-pkg-resources dirmngr
sudo pip3 install pip setuptools --upgrade
sudo pip3 install cffi --upgrade

sudo su -c 'echo "deb http://ppa.launchpad.net/learningequality/kolibri/ubuntu bionic main" > /etc/apt/sources.list.d/learningequality-ubuntu-kolibri-bionic.list'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys DC5BAA93F9E4AE4F0411F97C74F88ADB3194DD81
sudo apt update

sudo apt -y --allow-unauthenticated install kolibri kolibri-server
# Choose port 8008

server {
  listen 8008;
  listen [::]:8008;

  server_name kolibri kolibri.library;

  location / {
    proxy_pass http://127.0.0.1:8008;
  }
}


sudo nano /usr/lib/python3/dist-packages/kolibri/utils/cli.py
# change line 430 serve_http = OPTIONS["Server"]["CHERRYPY_START"]
# to serve_http = True

# add to ~/.bashrc
# KOLIBRI_CHERRYPY_START=True
