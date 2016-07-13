#/bin/bash
apt-get install ctags
rm ~/.vimrc -rf
cp ./Vimrc/.vimrc ~
rm ~/.vim -rf
mkdir ~/.vim
cp DotVim/* ~/.vim/ -r


