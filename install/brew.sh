#!/bin/sh

if test ! $(which brew); then
  echo "Installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing homebrew packages..."

# cli tools
brew install \
  tree \
  wget \
  bash-git-prompt

# dev tools
brew install \
  git \
  reattach-to-user-namespace \
  tmux \
  redis \
  neovim/neovim/neovim

# link the apps
brew linkapps

# exit 0
