#!/bin/bash

#Temporary script to uninstall all modifications

set -x

rm ~/.vim
rm ~/.vimrc
rm ~/.gvimrc
rm ~/.config/nvim

rm -rf ~/.tmux
rm ~/.tmux.conf

rm -rf ~/.zshrc
rm -rf ~/.zshrc.alias
rm -rf ~/.antigen
rm -rf ~/.zplug

chsh -s /bin/bash
