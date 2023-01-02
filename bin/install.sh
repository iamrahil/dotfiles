#!/bin/bash

DIR=$(dirname "$(readlink -f "$0")")

mkdir -p "$HOME"/.local/bin

#ln -s "$DIR" "$HOME/.local/bin/dotfiles"
touch "$HOME"/.profile  # Make sure this file exists to avoid warnings
PATH_STR="PATH=\$PATH:$DIR"
if ! grep "$PATH_STR" "$HOME/.profile"; then
  echo "$PATH_STR" >> "$HOME/.profile"
fi
