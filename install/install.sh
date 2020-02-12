#!/bin/bash

echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

if [ "$(uname)" == "Darwin" ]; then

  # neovim
  mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}

  echo "Brewing..."
  source install/brew.sh

  echo "Installing node..."
  source install/nvm.sh
  source install/node.sh
fi

echo "Done."
