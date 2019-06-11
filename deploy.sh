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

if [[ -d ~/.vim ]]; then
    if [[ ! -d ~/.vim/colors/ ]]; then
        mkdir ~/.vim/colors/
    fi
    cp colors_vim/*.vim ~/.vim/colors/
fi

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

echo "Checking gpg configuration..."
if [[ `which gpg | wc -l` == 0 ]]; then
    echo "!!! WARNING !!!"
    echo -e "\tgpg is not installed. Consider installing it using apt or via your preferred package manager."
elif [[ `gpg --list-keys | grep -i "Lizzy" | wc -l` == 0 ]]; then
    echo "!!! WARNING !!!"
    echo -e "\tgpg key does not exist for 'Lizzy'"
else
    gpg --list-keys
    echo -e "\n\n****** Please add your gpg key to git. ******"
    echo -e "\tUse:   git config --global user.signingKey"
    echo -e "\t\tNote: Make sure to add the correct signing key from the gpg output above "
    echo -e "\t\tand upload your key to your remote host (GitHub et. al.) as needed."
fi
echo -e "\tNOTE: git commits will not function until a keyring is available."

echo -e "\nDeploying .gitconfig"
if [[ -f ~/.gitconfig ]]; then
    mv ~/.gitconfig ~/.OLD_gitconfig
fi
cp ./.gitconfig ~/.gitconfig

# execute bash to get new prompt and bash features in terminal session
exec bash
