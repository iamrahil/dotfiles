#!/bin/bash

DIR=$(dirname "$(readlink -f "$0")")

ln -s "$DIR"/fish "$HOME"/.config/fish
ln -s "$DIR"/omf "$HOME"/.config/omf

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
