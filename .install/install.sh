#!/bin/bash

echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

if [ "$(uname)" == "Darwin" ]; then

  # neovim
  mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}

  echo "Brewing..."
  source .install/brew.sh

  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  echo "Installing node..."
  source .install/node.sh

  echo "Installing rust..."
  curl https://sh.rustup.rs -sSf | sh
fi

echo "Done."
