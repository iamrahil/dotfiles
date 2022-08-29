#!/bin/bash

bash vim/install.sh

# Setup tmux
ln -s "$PWD"/tmux/tmux.conf "$HOME"/.tmux.conf
git clone https://github.com/tmux-plugins/tpm "$HOME"/.tmux/plugins/tpm

# Setup zsh
git clone https://github.com/zplug/zplug "$HOME"/.zplug
ln -s "$PWD"/zsh/zshrc "$HOME"/.zshrc
ln -s "$PWD"/zsh/zshrc.alias "$HOME"/.zshrc.alias #TODO: Remove this;

# Set zsh as default shell
#chsh -s /bin/zsh

# Init zsh and antigen plugins
touch "$HOME"/.profile  # Make sure this file exists to avoid warnings
zsh -l
