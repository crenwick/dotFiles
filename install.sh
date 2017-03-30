#!/bin/bash

echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

if [ "$(uname)" == "Darwin" ]; then
  echo "creating symlinks"

  # bash
  ln -s `pwd`/bash/dot.bash_profile $HOME/.bash_profile

  # git
  ln -s `pwd`/git/dot.gitignore_global $HOME/.gitignore_global
  ln -s `pwd`/git/dot.gitconfig $HOME/.gitconfig

  # vim
  ln -s `pwd`/vim/dotVim $HOME/.vim
  ln -s `pwd`/vim/dot.vimrc $HOME/.vimrc

  # neovim
  mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
  ln -s `pwd`/vim/dotVim $XDG_CONFIG_HOME/nvim

  #tmux
  ln -s `pwd`/tmux/dot.tmux.conf $HOME/.tmux.conf

  #ctags
  ln -s `pwd`/dot.ctags $HOME/.ctags

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
