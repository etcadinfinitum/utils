#!/bin/bash

cp ~/.bashrc .
cp ~/.vimrc .
cp ~/vpn.sh .
cp ~/work.sh .
git diff .bashrc
git diff .vimrc
echo -e "\n\nRunning git commit now; press enter to continue"
read tmp
git add --all
git commit
rm .bashrc
rm .vimrc
rm vpn.sh
rm work.sh
