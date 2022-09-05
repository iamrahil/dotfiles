#!/bin/bash

DIR=$(dirname "$(readlink -f "$0")")

# Setup tmux
ln -s "$DIR"/tmux.conf "$HOME"/.tmux.conf
git clone https://github.com/tmux-plugins/tpm "$HOME"/.tmux/plugins/tpm
