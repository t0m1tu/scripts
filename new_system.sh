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
                sed -i "/s/plugins=(git)/plugins=(x/g" .zshrc
                sed -i "/plugins=(x/a\\git" ~/.zshrc
                sed -i "/plugins(x/a\\zsh-autosuggestions" ~/.zshrc
                sed -i "/plugins=(x/a\\zsh-syntax-highlighting" ~/.zshrc
                #sed -i "/plugins=(x/a\\x" ~/.zshrc
                sed -i "/plugins=(x/a\\sudo" ~/.zshrc
                sed -i "/plugins=(x/a\\extract" ~/.zshrc
                source ~/.zshrc
                git config --global user.name "t0m1tu"
                git config --global user.email "mzqgml@gmail.com"
                ssh-keygen
                wget https://github.com/t0m1tu/ssr-backup/raw/master/ShadowsocksR-Python.zip
                unzip ShadowsocksR-Python.zip shadowsocksR
                #python ~/ShadowsocksR/shadowsocks/local.py -c ~/ShadowsocksR/config.json
                #sudo echo "forward-socks5 / 127.0.0.1:1080 ." >> /etc/privoxy/config
                #echo "export http_proxy=http://127.0.0.1:8118" >> /etc/enviroment
                #echo "export https_proxy=http://127.0.0.1:8118" >> /etc/enviroment
                #sudo /etc/init.d/privoxy start
                cat ~/.ssh/id_rsa.pub
                mv ssr.sh ~/ssr.sh
                chmod +x ~/ssr.sh
                ;;
            centos|fedora|rhel)
                yumdnf="yum"
                if test "$(echo "$VERSION_ID >= 22" | bc)" -ne 0;
                then
                    yumdnf="dnf"
                fi
                sudo $yumdnf install -y git vim zsh curl wget openssh unzip unrar privoxy
                sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
                git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
                git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
                sed -i "/s/plugins=(git)/plugins=(x/g" .zshrc
                sed -i "/plugins=(x/a\\git" ~/.zshrc
                sed -i "/plugins(x/a\\zsh-autosuggestions" ~/.zshrc
                sed -i "/plugins=(x/a\\zsh-syntax-highlighting" ~/.zshrc
                #sed -i "/plugins=(x/a\\x" ~/.zshrc
                sed -i "/plugins=(x/a\\sudo" ~/.zshrc
                sed -i "/plugins=(x/a\\extract" ~/.zshrc
                source ~/.zshrc
                git config --global user.name "t0m1tu"
                git config --global user.email "mzqgml@gmail.com"
                ssh-keygen
                wget https://github.com/t0m1tu/ssr-backup/raw/master/ShadowsocksR-Python.zip
                unzip ShadowsocksR-Python.zip shadowsocksR
                #python ~/ShadowsocksR/shadowsocks/local.py -c ~/ShadowsocksR/config.json
                #sudo echo "forward-socks5 / 127.0.0.1:1080 ." >> /etc/privoxy/config
                #echo "export http_proxy=http://127.0.0.1:8118" >> /etc/enviroment
                #echo "export https_proxy=http://127.0.0.1:8118" >> /etc/enviroment
                #sudo /etc/init.d/privoxy start
                cat ~/.ssh/id_rsa.pub
                mv ssr.sh ~/ssr.sh
                chmod +x ~/ssr.sh
                ;;
            openwrt)
                opkg update
                echo '#!/bin/sh' > /root/echo_ip.sh
                echo 'newwanip=`wget http://ipecho.net/plain -q -O -`' >> /root/echo_ip.sh
                echo 'key="SCU43428Tc83dead8e10154baa6820305a9c851075c4d837016307"' >> /root/echo_ip.sh
                echo 'title="IP"' >> /root/echo_ip.sh
                echo 'date=`date +%Y-%m-%d`' >> /root/echo_ip.sh
                echo 'time=`date +%H:%M:%S`' >> /root/echo_ip.sh
                echo 'content="' >> /root/echo_ip.sh
                echo '${date}' >> /root/echo_ip.sh
                echo '${time}' >> /root/echo_ip.sh
                echo '${newwanip}"' >> /root/echo_ip.sh
                echo 'curl "http://sc.ftqq.com/${key}.send?text=${title}" -d "&desp=${content}"' >> /root/echo_ip.sh
                chmod +x /root/echo_ip.sh
                sed -i "/exit 0/i\\sleep 100" /etc/rc.local
                sed -i "/exit 0/i\\sh /root/echo_ip.sh" /etc/rc.local
                ;;
            *)
                exit 1
                ;;
        esac
    elif [ -x /data/data/com.termux/files/home ];then
        pkg install git vim zsh curl wget openssh unzip unrar nodejs
        sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
        git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        sed -i "/s/plugins=(git)/plugins=(x/g" .zshrc
        sed -i "/plugins=(x/a\\git" ~/.zshrc
        sed -i "/plugins(x/a\\zsh-autosuggestions" ~/.zshrc
        sed -i "/plugins=(x/a\\zsh-syntax-highlighting" ~/.zshrc
        #sed -i "/plugins=(x/a\\x" ~/.zshrc
        sed -i "/plugins=(x/a\\sudo" ~/.zshrc
        sed -i "/plugins=(x/a\\extract" ~/.zshrc
        chsh -s zsh
        source ~/.zshrc
        ssh-keygen
        git config --global user.name "t0m1tu"
        git config --global user.email "mzqgml@gmail.com"
        cat ~/.ssh/id_rsa.pub
    fi
else
    echo "Other OS: ${OS}"
fi
