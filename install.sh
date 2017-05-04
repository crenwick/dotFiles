#!/bin/bash

echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

if [ "$(uname)" == "Darwin" ]; then
  echo "creating symlinks"

  # bash
  ln -s `pwd`/bash_profile $HOME/.bash_profile
  ln -s `pwd`/bashrc $HOME/.bashrc

  # git
  ln -s `pwd`/gitignore_global $HOME/.gitignore_global
  ln -s `pwd`/gitconfig $HOME/.gitconfig

  #tmux
  ln -s `pwd`/tmux.conf $HOME/.tmux.conf

  #ctags
  ln -s `pwd`/ctags $HOME/.ctags

  # vim
  ln -s `pwd`/vim $HOME/.vim
  ln -s `pwd`/vimrc $HOME/.vimrc

  # neovim
  mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
  ln -s `pwd`/vim $XDG_CONFIG_HOME/nvim

  echo "Running on OSX"

  echo "Brewing..."
  source install/brew.sh

  echo "Cask brewing..."
  source install/brewCask.sh

  echo "Installing node..."
  source install/nvm.sh
  source install/node.sh
fi

echo "Done."
