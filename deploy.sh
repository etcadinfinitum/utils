#!/bin/bash

echo "Deploying .bashrc"
if [[ -f ~/.bashrc ]]; then
    mv ~/.bashrc ~/.bashrc_OLD
fi
cp ./.bashrc ~/.bashrc

echo "Deploying .vimrc"
if [[ -f ~/.vimrc ]]; then
    mv ~/.vimrc ~/.vimrc_OLD
fi
cp ./.vimrc ~/.vimrc

if [[ `which vim | wc -l` == 0 ]]; then
    echo "!!! WARNING !!!"
    echo -e "\tvim is not installed. Consider installing it using apt or via your preferred package manager."
fi

if [[ `which perl | wc -l` == 0 ]]; then
    echo "!!! WARNING !!!"
    echo -e "\tperl is not installed."
else
    echo "Terminal colors:"
    perl 256color.pl
fi

# execute bash to get new prompt and bash features in terminal session
exec bash
