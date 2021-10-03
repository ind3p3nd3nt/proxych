#!/bin/bash
if [ -f /usr/bin/apt ]; then apt-get update && apt-get install build-essential git tor -y; else yum groupinstall "Development Tools" -y && yum install tor -y; fi;
git clone https://github.com/rofl0r/proxychains-ng;
cd ./proxychains-ng;
./configure --prefix='/usr';
make -j8;
make install;
cd;
cp -r /usr/bin/proxychains4 /usr/bin/proxychains;
wget -O /etc/proxychains.conf https://github.com/ind3p3nd3nt/proxych/raw/main/proxychains.conf --no-check-certificate;
service tor stop && systemctl enable tor && service tor start;
echo 'now you can use: proxychains program args  to cloak your programs connections';
