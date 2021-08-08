#!/bin/sh

#check for root permission

if [ "$EUID" -ne 0 ]
  then echo "Please run this installer as root (sudo ./linux_install.sh)."
  exit
fi

#get package manager and installing dependencies


if command -v apt &> /dev/null
then
    echo "Installing dependencies (apt)"
    apt-get install gcc build-essential libgc-dev checkinstall zlib1g-dev libssl-dev -y
    
else
    if command -v pacman &> /dev/null
    then
        echo "Installing dependencies (pacman)"
        pacman -S gcc base-devel gc zlib-devel openssl -y
        
    else
        echo "Could not install dependencies, no package manager found (pacman or apt)."
        exit
    fi
fi


mkdir /opt/bah
cp ./libs/linux_amd64/* /opt/bah/
cp ./libs/common/* /opt/bah/
cp -s /opt/bah/bah /usr/bin/bah
chmod +x /bin/bah
