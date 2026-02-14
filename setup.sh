#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Terminal Setup
echo ln -s $SCRIPT_DIR/.zshrc $HOME/.zshrc
echo ln -s $SCRIPT_DIR/.gitconfig $HOME/.gitconfig
echo source $HOME/.zshrc

## TODO: Install fonts
#https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hack.zip

# Brew setup
echo brew install $( cat $SCRIPT_DIR/brewpackages )

# nvim setup
PLUGINDIR=${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site
echo ln -s $SCRIPT_DIR/nvim ${XDG_CONFIG_HOME:-$HOME/.config}/nvim
echo mkdir -p ${PLUGINDIR}
echo ln -s $SCRIPT_DIR/autoload ${PLUGINDIR}/autoload

# Docker buildx setup (for Colima)
mkdir -p ~/.docker/cli-plugins
ln -s $(which docker-buildx) ~/.docker/cli-plugins/docker-buildx
