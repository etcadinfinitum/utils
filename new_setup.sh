#!/bin/bash

echo "This is a master script to install useful programs,"
echo "utilities, and miscellaneous things."

echo "This script assumes that you have sudo installed."
echo "To install, run:"
echo -e "\tsu -"
echo -e "\tapt-get install sudo"
echo -e "\tusermod -aG <username>"
echo "then log out + back in to have sudo permissions take effect for the user of interest."

cp ./.bashrc $HOME

echo -e "\nRunning install utilities now...\n"

# git, java8, python3, vim
sudo apt-get install build-essential git python3-dev python3 vim openjdk-8-jre curl

echo -e "\nCompleted installation of core packages.\n"

echo -e "\nInstalling Golang."
if [[ `which go | wc -l` == 0 ]]; then
    cd $HOME/Downloads
    wget -c https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz
    sudo tar -C /usr/local -xvzf go1.7.3.linux-amd64.tar.gz
    mkdir -p $HOME/code/go/{bin,src,pkg}
    sudo echo 'export GOPATH="$HOME/code/go"' >> ~/.bashrc
    sudo echo 'export GOBIN="$GOPATH/bin"' >> ~/.bashrc
    sudo echo 'export PATH=/usr/local/go/bin:$PATH' >> ~/.bashrc
fi

echo -e "\nInstalled Golang."
go version

echo -e "\nInstalling pathogen for vim + deploying colorscheme."
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
mkdir -p ~/.vim/colors && cp ./colors_vim/vimbrant.vim ~/.vim/colors

echo -e "\nInstalling YouCompleteMe for vim."
cd ~/.vim/bundle
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
python3 install.py --clang-completer --java-completer --go-completer --rust-completer


