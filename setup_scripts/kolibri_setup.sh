#!/usr/bin/env bash

echo ""
echo "Kolibri setup"
echo ""
--yes --allow-unauthenticated


sudo apt --yes --allow-unauthenticated install libffi-dev python3-pip python3-pkg-resources dirmngr
sudo pip3 install pip setuptools --upgrade
sudo pip3 install cffi --upgrade

sudo su -c 'echo "deb http://ppa.launchpad.net/learningequality/kolibri/ubuntu bionic main" > /etc/apt/sources.list.d/learningequality-ubuntu-kolibri-bionic.list'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys DC5BAA93F9E4AE4F0411F97C74F88ADB3194DD81
sudo apt update

sudo apt install kolibri kolibri-server



cd ~
rm -rf ~/smile-pi
git clone https://github.com/canuk/smile-pi

# sudo cp ~/smile-pi/setup_files/kalite.service /usr/lib/systemd/system/
# sudo systemctl enable kalite
# sudo systemctl start kalite

cd; cd -
cd ~/smile-pi
