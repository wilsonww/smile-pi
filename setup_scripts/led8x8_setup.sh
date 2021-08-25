#!/usr/bin/env bash

echo "LED 8x8 python prep"
cd /home/pi/
sudo apt-get install python3-pip
sudo pip3 install rpi_ws281x

echo "systemctl service configurations"
sudo cp /home/pi/smile-pi/setup_files/smile8x8.service /etc/systemd/system/smile8x8.service
sudo systemctl enable smile8x8
sudo systemctl start smile8x8

## Note: We used to have two services, one to start and one to stop, but now it's handled all by the smile8x8 service.
#echo "sad face when shutting down"
#sudo mkdir /usr/lib/systemd/system-shutdown/
#sudo cp /home/pi/smile-pi/setup_files/shutdownsad8x8.service /etc/systemd/system/shutdownsad8x8.service

echo "done"
