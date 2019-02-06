#!/bin/bash

OS=`uname -s`
if [ ${OS} = "Darwin"  ];then
    sudo brew install git vim zsh curl wget openssh
elif [ ${OS} = "Linux"  ];then
    if [ -f /etc/os-release ];then
    # for the path if [ -x /etc/ ];then
        source /etc/os-release
        case $ID in
            debian|ubuntu|devuan)
                sudo apt-get install git vim zsh curl wget ssh unzip unrar privoxy
                sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
                git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
                git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
                #sed -i '/git/a\\zsh-autosuggestions' ~/.zshrc
                #sed -i '/git/a\\zsh-syntax-highlighting' ~/.zshrc
                #sed -i '/git/a\\x' ~/.zshrc
                #sed -i '/git/a\\sudo' ~/.zshrc
                #sed -i '/git/a\\extract' ~/.zshrc
                source ~/.zshrc
                ssh-keygen
                #wget https://github.com/t0m1tu/ssr-backup/raw/master/ShadowsocksR-Python.zip
                #unzip ShadowsocksR-Python.zip shadowsocksR
                #python ~/ShadowsocksR/shadowsocks/local.py -c ~/ShadowsocksR/config.json
                #echo "export http_proxy=http://127.0.0.1:8118" >> /etc/enviroment
                #echo "export https_proxy=http://127.0.0.1:8118" >> /etc/enviroment
                #sudo /etc/init.d/privoxy start
                cat ~/.ssh/id_rsa.pub
                ;;
            centos|fedora|rhel)
                yumdnf="yum"
                if test "$(echo "$VERSION_ID >= 22" | bc)" -ne 0;
                then
                    yumdnf="dnf"
                fi
                sudo $yumdnf install -y git vim zsh curl wget openssh
                ;;
            openwrt)
                opkg update
                ;;
            *)
                exit 1
                ;;
        esac
    elif [ -x /data/data/com.termux/files/home ];then
        pkg install git vim zsh curl wget openssh unzip unrar
        sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
        git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        cat ~/.ssh/id_rsa.pub
    fi
else
    echo "Other OS: ${OS}"
fi
