#!/bin/sh

if test ! $(which brew); then
  echo "Installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing homebrew packages..."

# cli tools
brew install tree
brew install wget
brew install bash-git-prompt

# dev tools
brew install git
brew install macvim --override-system-vim --with-cscope --python --HEAD
brew install reattach-to-user-namespace
brew install tmux
brew install nvm

# install neovim
brew tap neovim/neovim
brew install --HEAD neovim

# link the apps
brew linkapps

# exit 0
