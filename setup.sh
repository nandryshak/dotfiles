#!/bin/bash

# Makes directories
mkdir ~/.vim
mkdir ~/.vim/bundle
mkdir ~/.vim/undo
mkdir ~/.vim/backups

# Hard links vim configs
ln ~/dotfiles/.vimrc ~/.vimrc
ln ~/dotfiles/.vim/functions.vim ~/.vim/functions.vim
ln ~/dotfiles/.vim/bundles.vim ~/.vim/bundles.vim

# Clones vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Installs plugins
vim +BundleInstall +qall

# Clones snippets
git clone https://github.com/nandryshak/UltiSnips.git ~/.vim/bundle/ultisnips
