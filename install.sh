#!/bin/bash
if [ -f /usr/bin/apt ]; then apt-get update && apt-get install build-essential git tor -y; else yum groupinstall "Development Tools" -y && yum install tor -y; fi;
git clone https://github.com/rofl0r/proxychains-ng;
./proxychains-ng/configure --prefix='/usr' && ./proxychains-ng/make -j8 && ./proxychains-ng/make install;
cp -r /usr/bin/proxychains4 /usr/bin/proxychains;
service tor stop && systemctl enable tor && service tor start;
echo 'now you can use: proxychains program args  to cloak your programs connections';
