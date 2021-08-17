#!/bin/sh

#get package manager and installing dependencies
if command -v brew &> /dev/null
then
    echo "Installing dependencies (brew)"
    xcode-select --install
    brew install gcc
    brew install binutils
    brew install libgc
    brew install zlib
    brew install openssl

else
    pause -p "Homebrew is not installed, would you like to install it? (y/n): "
    if [ ${REPLY} = "y" ]
    then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        ./install_macos.sh
    else
        exit
    fi
fi

sudo rm /usr/bin/gcc
sudo ln -s /usr/local/bin/gcc-11 /usr/bin/gcc
sudo mkdir /opt
sudo mkdir /opt/bah
sudo cp ./libs/darwin_amd64/* /opt/bah/
sudo cp ./libs/common/* /opt/bah/
sudo ln -s /opt/bah/bah /bin/bah
sudo chmod +x /bin/bah
