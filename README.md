# DotFiles
v6.0

## Contents

- bashrc configuration
- git configuration
- vim configuration (neovim + vim) (TODO)
- node install + npm globals (via nvm) (TODO?)
- homebrew + cask setup (TODO?)

## Install

- `git clone <remote-info> ./.dotfiles`
- `git --git-dir ~/.dotfiles/.git --work-tree=$HOME config --local status.showUntrackedFiles no`
- `git --git-dir ~/.dotfiles/.git --work-tree=$HOME reset --hard`

## Vim Setup (outdated?)

1. Install plugins:
  - run `vim +PlugInstall` (or `nvim +PlugInstall`).
  - Vim plugins are managed with [vim-plug](https://github.com/junegunn/vim-plug).
