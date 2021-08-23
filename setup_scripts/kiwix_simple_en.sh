#!/usr/bin/env bash

mkdir -p ~/kiwix
cd ~/kiwix

echo "downloading Simple English Wikipedia ZIM file (~2GB)"
#https://wiki.kiwix.org/wiki/Content_in_all_languages
wget https://download.kiwix.org/zim/wikipedia_en_simple_all_maxi.zim --progress=bar:force

echo "Adding to Kiwix Library"
~/kiwix/kiwix-manage library.xml add ~/kiwix/wikipedia_en_simple_all_maxi.zim
sudo systemctl restart kiwix