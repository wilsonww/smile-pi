#!/usr/bin/env bash

# Setup CouchDB 

sudo apt update
sudo apt -y upgrade

sudo apt update
sudo apt-get --no-install-recommends -y install build-essential pkg-config erlang libicu-dev libmozjs185-dev libcurl4-openssl-dev

sudo adduser --system \
        --shell /bin/bash \
        --group --gecos \
        "CouchDB Administrator" couchdb

curl -s https://api.github.com/repos/apache/couchdb/releases/latest \
  | grep browser_download_url \
  | cut -d '"' -f 4 \
  | wget -qi -

tar xvf apache-couchdb-*.tar.gz
cd apache-couchdb-*/
./configure

make release

sudo cp -r rel/couchdb /home/couchdb
sudo chown -R couchdb:couchdb /home/couchdb/

find /home/couchdb -type d -exec chmod 0770 {} \;
chmod 0644 /home/couchdb/couchdb/etc/*

sudo tee /etc/systemd/system/couchdb.service<<EOF
[Unit]
Description=Couchdb service
After=network.target

[Service]
Type=simple
User=couchdb
ExecStart=/home/couchdb/couchdb/bin/couchdb -o /dev/stdout -e /dev/stderr
Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl start couchdb.service
sudo systemctl enable couchdb.service
