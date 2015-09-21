#!/bin/sh

echo "Installing homebrew-cask"

brew install caskroom/cask/brew-cask

echo "Installing cask applications..."

brew cask install iterm2

# add to the list?
# firefox; dockertoolbox; chrome;

# exit 0
