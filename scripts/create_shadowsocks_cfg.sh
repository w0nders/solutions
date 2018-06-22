#!/bin/bash

apt-get -y update
apt-get -y install shadowsocks-libev
apt-get -y install shadowsocks
apt-get -y install apache2 


ip=`ifconfig eth0 |grep -e 'inet addr:'|awk '{FS=":";print $2}'| sed 's/addr://g'`
passwd="GoTest2018"

echo "
{
    \"server\":"\"$ip"\",
    \"server_port\":8388,
    \"local_address\": "\"$ip"\",
    \"local_port\":1080,
    \"password\":"\"$passwd"\",
    \"timeout\":300,
    \"method\":\"aes-256-cfb\",
    \"fast_open\": false,
    \"workers\": 1
}" > /etc/shadowsocks/config.json

echo \<center\>\<h1\>Hello world!\</h1\>\<br/\>\</center\> > /var/www/html/index.html


apachectl restart
sudo systemctl enable shadowsocks
sudo systemctl restart shadowsocks