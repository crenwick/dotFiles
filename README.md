# DotFiles
v6.0

## Contents

- bashrc configuration
- git configuration
- vim configuration (neovim + vim)
- node install + npm globals (via nvm)
- homebrew + cask setup

## Install

$ ssh someothermachine
$ git clone <remote-info> ./.dotfiles
$ git --git-dir ~/.dotfiles/.git --work-tree=$HOME reset --hard

## Vim Setup (outdated?)

1. Install plugins:
  - run `vim +PlugInstall` (or `nvim +PlugInstall`).
  - Vim plugins are managed with [vim-plug](https://github.com/junegunn/vim-plug).
