#!/usr/bin/env bash

mkdir -p ~/kiwix
cd ~/kiwix

echo "downloading Español mini Wikipedia ZIM file (~2GB)"
#https://wiki.kiwix.org/wiki/Content_in_all_languages
wget https://download.kiwix.org/zim/wikipedia_es_all_mini.zim --progress=bar:force

echo "Adding to Kiwix Library"
~/kiwix/kiwix-manage library.xml add ~/kiwix/wikipedia_es_all_mini.zim
sudo systemctl restart kiwix