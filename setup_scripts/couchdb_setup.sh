#!/usr/bin/env bash

# Setup CouchDB

sudo apt update
sudo apt --yes --allow-unauthenticated upgrade

# libmozjs constantly updates, need to adjust versions above accordingly
sudo apt update
sudo apt-get --no-install-recommends -y install build-essential pkg-config erlang libicu-dev libmozjs-78-dev libcurl4-openssl-dev

sudo adduser --system \
        --shell /bin/bash \
        --group --gecos \
        "CouchDB Administrator" couchdb

cd 

wget http://apache.cs.utah.edu/couchdb/source/2.3.1/apache-couchdb-2.3.1.tar.gz

tar xvf apache-couchdb-*.tar.gz
cd apache-couchdb-*/
./configure

# in the future using ./configure --spidermonkey-version 78 should work
# because ./configure --spidermonkey-version 78 errors out at the moment, hack the config 
sed -i 's/spidermonkey_version, "1.8.5"/spidermonkey_version, "78"/' rel/couchdb.config

make release

sudo cp -r rel/couchdb /home/couchdb

# allow access to 0.0.0.0 and create initial admin password otherwise couchdb 3 fails to start
sed -i 's/;bind_address = 127.0.0.1/bind_address = 0.0.0.0/' /home/couchdb/couchdb/etc/local.ini
sed -i 's/;admin = mysecretpassword/admin = password/' /home/couchdb/couchdb/etc/local.ini

sudo chown -R couchdb:couchdb /home/couchdb/

sudo find /home/couchdb -type d -exec chmod 0770 {} \;
sudo chmod 0644 /home/couchdb/couchdb/etc/*

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

# allow access from external IPs
# edit /home/couchdb/couchdb/etc/local.ini
# Change this line:
#  ;bind_address = 127.0.0.1
#  to:
#  bind_address = 0.0.0.0

sudo systemctl daemon-reload
sudo systemctl start couchdb.service
sudo systemctl enable couchdb.service
