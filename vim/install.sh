#!/bin/bash

echo "Dependencies: vim, zsh"

DIR=$(dirname "$(readlink -f "$0")")

# Setup neovim
mkdir -p "$HOME"/.config
ln -s "$DIR" "$HOME"/.config/nvim

# Init vim
nvim +PlugInstall +qall
