#!/bin/bash

bash vim/install.sh

# Setup tmux
ln -s "$PWD"/tmux/tmux.conf "$HOME"/.tmux.conf
git clone https://github.com/tmux-plugins/tpm "$HOME"/.tmux/plugins/tpm

bash zsh/install.sh

# Init zsh and antigen plugins
touch "$HOME"/.profile  # Make sure this file exists to avoid warnings
zsh -l
