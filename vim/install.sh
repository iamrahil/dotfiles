#!/bin/bash
set -x

echo "Dependencies: vim, zsh"

DIR=$(dirname $(readlink -f "$0"))
# Setup vim
ln -s "$DIR" "$HOME"/.vim
ln -s "$HOME"/.vim/init.vim "$HOME"/.vimrc
ln -s "$HOME"/.vim/gvimrc "$HOME"/.gvimrc

# Setup neovim
mkdir -p "$HOME"/.config
ln -s "$DIR" "$HOME"/.config/nvim

# Init vim
vim +PlugInstall +qall
