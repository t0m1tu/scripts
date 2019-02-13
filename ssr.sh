#!/usr/bin/env bash
python ~/ShadowsocksR/shadowsocks/local.py -c ~/ShadowsocksR/config.json
echo "export http_proxy=http://127.0.0.1:8118" >> /etc/enviroment
echo "export https_proxy=http://127.0.0.1:8118" >> /etc/enviroment
sudo /etc/init.d/privoxy start