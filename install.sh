#!/bin/bash

echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

if [ "$(uname)" == "Darwin" ]; then
  echo "creating symlinks"

  # bash
  ln -s `pwd`/bash/dotBash_profile $HOME/.bash_profile

  # git
  ln -s `pwd`/git/dotGitignore_global $HOME/.gitignore_global
  ln -s `pwd`/git/dotGitconfig $HOME/.gitconfig

  # vim
  ln -s `pwd`/vim/dotVim $HOME/.vim
  ln -s `pwd`/vim/dotVimRc $HOME/.vimrc

  # macvim
  ln -s `pwd`/vim/dotGVimRc $HOME/.gvimrc

  # neovim
  ln -s `pwd`/vim/dotVim $HOME/.nvim
  ln -s `pwd`/vim/dotNVimRc $HOME/.nvimrc

  echo "Running on OSX"

  echo "Brewing..."
  source install/brew.sh

  echo "Cask brewing..."
  source install/brewCask.sh

  echo "Installing node..."
  source install/node.sh

  # echo "Installing node (from nvm)"
  # source install/nvm.sh
fi

echo "Done."
