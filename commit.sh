#!/bin/bash

cp ~/.bashrc .
cp ~/.vimrc .
cp ~/vpn.sh .
cp ~/lab.sh .
if [[ ! -d colors_vim/ ]]; then mkdir colors_vim/; fi
cp ~/.vim/colors/*.vim colors_vim/
cat ~/.gitconfig | grep -v signingKey > .gitconfig
git diff

echo -e "\n\nRunning git commit now"

# give a nice prompt to do commit vs commit --amend
echo "Enter 1 to do a fresh commit, 2 to do 'commit --amend': "
read amend

# use read value to do commit
if [[ $amend == "1" ]]; then
    git add --all
    git commit
elif [[ $amend == "2" ]]; then
    git add --all
    git commit --amend
else
    echo "Invalid option provided. Aborting commit."
    # git reset HEAD *
    # exit 0
fi

rm .bashrc
rm .vimrc
rm vpn.sh
rm lab.sh
rm .gitconfig
rm colors_vim/*.vim
rmdir colors_vim/
