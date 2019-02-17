#!/usr/bin/env bash
export http_proxy=http://127.0.0.1:8118
export https_proxy=http://127.0.0.1:8118
sudo /etc/init.d/privoxy start
python ~/ShadowsocksR/shadowsocks/local.py -c ~/ShadowsocksR/config.json
