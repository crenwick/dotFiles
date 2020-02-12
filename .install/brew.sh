#!/bin/sh

if test ! $(which brew); then
  echo "Installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing homebrew packages..."

# cli tools
brew install \
  ack \
  amazon-ecs-cli \
  autoconf \
  elixir \
  erlang \
  fzf \
  git \
  neovim \
  node \
  pyenv \
  python \
  python@3.8 \
  ripgrep \
  ruby \
  sqlite \
  telnet \
  tmux \
  tree \
  vim \
  wget \ 
  youtube-dl \
  zsh \
  zsh-completions

echo "Installing cask applications..."

brew cask

brew cask install \
  chromedriver \
  cyberduck \
  docker \
  firefox \
  gitup \
  google-chrome \
  iterm2 \
  kitematic \
  pgadmin4 \
  postico \
  postman \
  spotify \
  tableplus \
  visual-studio-code \
  wkhtmltopdf

# link the apps
brew cleanup

# exit 0
