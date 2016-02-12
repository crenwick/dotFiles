# DotFiles
v3.2

## Contents

- bashrc configuration
- git configuration
- vim configuration (macvim and neovim)
- nvm configuration (node.js and iojs)
- homebrew files (+ cask)

## Install

1. `git clone git@github.com:crenwick/.dot.git ~/dotFiles`
1. `cd ~/dotFiles`
1. `./install.sh`

## Vim Setup

1. Install plugins:
  - run `vim +PlugInstall` (or `nvim +PlugInstall`).
  - Vim plugins are managed with [vim-plug](https://github.com/junegunn/vim-plug).
1. Install the [Inconsolata + Powerline + Nerd + FontAwesome + Octicons + Pomicons + Mono](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Inconsolata/additional-variations/Inconsolata%20for%20Powerline%20Nerd%20Font%20Plus%20Font%20Awesome%20Plus%20Octicons%20Plus%20Pomicons%20Mono.otf) font.
1. Make your MacVim use the [VimBox](https://github.com/jordwalke/VimBox) icon.
  - Find `/Applicatin/MacVim.app`.
  - Select it and press `⌘+i` and an information window about MacVim should open.
  - Drag `images/ApplicationIcon.icns` onto the little icon in that information window.
  - Restart MacVim.
