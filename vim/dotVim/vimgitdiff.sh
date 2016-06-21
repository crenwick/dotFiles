#! /bin/bash

if [[ -f /usr/local/bin/nvim ]]
then
    # neovim
    VIMPATH='nvim -d -O'
else
    # fall back to original vim
    VIMPATH='vimdiff'
fi

$VIMPATH '+windo set diff scrollbind scrollopt+=hor nowrap' -c 'au VimLeave * !open -a iTerm' $@
