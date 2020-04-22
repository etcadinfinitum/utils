#!/bin/bash

echo "This is a master script to install useful programs, utilities, and miscellaneous things."

echo "This script assumes that you have sudo installed."
echo "To install, run:"
echo -e "\tsu -"
echo -e "\tapt-get install sudo"
echo -e "\tusermod -aG <username>"
echo "then log out + back in to have sudo permissions take effect for the user of interest."

cp ./.bashrc $HOME

echo -e "\nRunning install utilities now...\n"

# git, java8, python3, vim
sudo apt-get install -y build-essential git python3 python3-dev python3-pip curl vim vim-gtk tree fortune-mod java-devel valgrind lshw htop g++ gcc clang libtinfo5 dnsutils pandoc texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra wkhtmltopdf &> /dev/null

echo -e "\nCompleted installation of core packages.\n"

if [[ ! -d $HOME/code/go/bin ]]; then
    echo -e "\nInstalling Golang."
    cd $HOME/Downloads
    wget -c https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz
    sudo tar -C /usr/local -xvzf go1.7.3.linux-amd64.tar.gz &> /dev/null
    GOVAR='export PATH=$PATH:/usr/local/go/bin'
    grep -xqF "$GOVAR" ~/.bashrc || echo "$GOVAR" >> ~/.bashrc && source ~/.bashrc
    mkdir -p $HOME/code/go/{bin,src,pkg}
    echo -e "\nInstalled Golang."
    which go
    go version
fi


if [[ ! -f ~/.vim/autoload/pathogen.vim ]]; then
    echo -e "\nInstalling pathogen for vim."
    mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

echo -e "\nInstalling colorschemes and simple utils for vim."
cd ~/.vim/bundle
# arduino plugin
if [[ ! -d ~/.vim/bundle/vim-arduino ]]; then 
    git clone https://github.com/stevearc/vim-arduino &> /dev/null
    if [[ $? == 0 ]]; then 
        echo "Arduino plugin installed. Download the Arduino IDE here: https://www.arduino.cc/en/Main/Software"
    else 
        echo "Arduino plugin install failed."
    fi
fi
# dracula color scheme
if [[ ! -d ~/.vim/bundle/dracula ]]; then
    git clone https://github.com/dracula/vim > /dev/null
    mv vim/ dracula/
fi
# vimbrant color scheme
if [[ ! -d ~/.vim/bundle/vimbrant ]]; then
    git clone https://github.com/thayerwilliams/vimbrant > /dev/null
    if [[ ! -d vimbrant/colors ]]; then 
        mkdir -p vimbrant/colors
        cp vimbrant/vimbrant.vim vimbrant/colors
    fi
fi
# zenburn color scheme
if [[ ! -d ~/.vim/bundle/Zenburn ]]; then
    git clone https://github.com/jnurmine/Zenburn > /dev/null
fi

# install cmake!
if [[ ! -d ~/.vim/bundle/YouCompleteMe && `which cmake | wc -l` == 0 ]]; then
    echo -e "\nInstalling cmake."
    cd /usr/local/bin
    sudo wget https://github.com/Kitware/CMake/releases/download/v3.15.2/cmake-3.15.2.tar.gz
    sudo tar -zxvf cmake-3.15.2.tar.gz > /dev/null
    cd cmake-3.15.2
    sudo ./bootstrap
    sudo make
    sudo make install
    cmake --version
    if [[ $? != 0 ]]; then echo "cmake installation failed. Exiting."; exit 1; fi
    echo -e "\nInstalling YouCompleteMe for vim."
    cd ~/.vim/bundle
    git clone https://github.com/Valloric/YouCompleteMe.git
    cd YouCompleteMe
    git submodule update --init --recursive
    python3 install.py --clang-completer --java-completer --go-completer --rust-completer
fi
