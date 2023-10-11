#!/bin/bash

DIR=$(dirname "$(readlink -f "$0")")

git clone https://github.com/zplug/zplug "$HOME"/.zplug
ln -s "$DIR"/zshrc "$HOME"/.zshrc
ln -s "$DIR"/zshrc.alias "$HOME"/.zshrc.alias #TODO: Remove this;

touch ~/.zshrc.before
touch ~/.zshrc.after

touch "$HOME"/.profile  # Make sure this file exists to avoid warnings
