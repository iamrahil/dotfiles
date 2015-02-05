#!/bin/bash

echo "Dependencies: vim, zsh"
#TODO: Use readline/dirname to get directory of script

# Setup vim
ln -s $PWD/vim/vim $HOME/.vim
ln -s $HOME/.vim/vimrc $HOME/.vimrc
ln -s $HOME/.vim/gvimrc $HOME/.gvimrc

# Setup zsh
git clone https://github.com/zsh-users/antigen.git $HOME/.antigen #FixMe: Standardize
ln -s $PWD/zsh/zshrc $HOME/.zshrc
ln -s $PWD/zsh/zshrc.alias $HOME/.zshrc.alias #TODO: Remove this;

# Init vim
vim +PlugInstall +qall
