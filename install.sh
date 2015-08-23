#!/bin/bash

echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

echo "creating symlinks"
# bash
ln -s `pwd`/bash/dotBash_profile ~/.bash_profile

# git
ln -s `pwd`/git/dotGitignore_global ~/.gitignore_global
ln -s `pwd`/git/dotGitconfig ~/.gitconfig

# vim
ln -s `pwd`/vim/dotVim ~/.vim
ln -s `pwd`/vim/dotVimRc ~/.vimrc
ln -s `pwd`/vim/dotGVimRc ~/.gvimrc

# neovim
ln -s `pwd`/vim/dotVim ~/.nvim
ln -s `pwd`/vim/dotVimRc ~/.nvimrc

if [ "$(uname)" == "Darwin" ]; then
  echo "Running on OSX"

  echo "Brewing..."
  source install/brew.sh

  echo "Cask brewing..."
  source install/brewCask.sh

  echo "Installing node (from nvm)"
  source install/nvm.sh
fi

echo "Done."
