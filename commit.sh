#!/bin/bash

cp ~/.bashrc .
git diff .bashrc
echo -e "\n\nRunning git commit now; press enter to continue"
read tmp
git add --all
git commit
rm .bashrc

