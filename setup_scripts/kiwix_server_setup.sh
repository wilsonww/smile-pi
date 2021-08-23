#!/usr/bin/env bash

# Install the Kiwix (Wikipedia) Server
mkdir -p ~/kiwix
cd ~/kiwix

if [ ! -f ~/kiwix/kiwix-serve ]; then
  echo "download the kiwix-server binary"
  cd ~/kiwix/
    wget https://download.kiwix.org/release/kiwix-tools/kiwix-tools_linux-armhf.tar.gz --progress=bar:force -O kiwix-server-arm.tar.gz
    tar -xvf kiwix-server-arm.tar.gz
fi
echo "done with downloading kiwix-serve binary, move to /usr/share"

cp ~/kiwix/kiwix-tools*/* ~/kiwix/
sudo mkdir -p /usr/share/kiwix
sudo \cp ~/kiwix/kiwix-serve /usr/share/kiwix/kiwix-serve

#then use this command to start the server:
#sudo /usr/share/kiwix/kiwix-serve --port=8001 --library ~/kiwix/library.xml 

cd ~/smile-pi/setup_files/
#http://uranio-235.github.io/blog/2016/07/31/kiwix-como-servicio/
sudo cp -rf kiwix.service /usr/lib/systemd/system/kiwix.service

echo "systemctl for kiwix"
sudo systemctl enable kiwix
sudo systemctl start kiwix

cd; cd -
cd ~/smile-pi