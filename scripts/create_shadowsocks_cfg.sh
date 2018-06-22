#!/bin/bash

ip=`ifconfig eth0 |grep -e 'inet addr:'|awk '{FS=":";print $2}'| sed 's/addr://g'`
passwd="GoTest2018"

echo ="
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
}" > /etc/shadowsocks-libev/config.json