#!/bin/bash

mkdir ~/.vim
mkdir ~/.vim/bundle
mkdir ~/.vim/undo
mkdir ~/.vim/backups

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

ln ~/dotfiles/.vimrc ~/.vimrc
ln ~/dotfiles/.vim/functions.vim ~/.vim/functions.vim
ln ~/dotfiles/.vim/bundles.vim ~/.vim/bundles.vim

vim +BundleInstall +qall
