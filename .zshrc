# Setup homebrew

if [[ "$(uname -m)" == "arm64" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="blinks"
# ZSH_THEME="agnoster"
ZSH_THEME="af-magic"

plugins=(git asdf docker tmux)

if [[ "$TERM_PROGRAM" != "vscode" ]]; then
  # Open tmux on startup, requires tmux plugin
  # ZSH_TMUX_AUTOSTART=true
fi

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt INC_APPEND_HISTORY     # immediatley append to history file
setopt EXTENDED_HISTORY       # record timestamp in history
setopt HIST_EXPIRE_DUPS_FIRST # expire duplicate entires first when trimming history
setopt HIST_FIND_NO_DUPS      # do not display a line previously found
# setopt HIST_IGNORE_DUPS       # dont record an entry that was just recorded again
# setopt HIST_IGNORE_ALL_DUPS   # delete old recorded entry if a new entry is a dup
# setopt HIST_IGNORE_SPACE      # dont record an entry starting with a space
# setopt HIST_SAVE_NO_DUPS      # dont write dupes in the history file
setopt SHARE_HISTORY          # share history between all sessions
unsetopt HIST_VERIFY          # execute cmds using history immediatley

export KEYTIMEOUT=1

source $ZSH/oh-my-zsh.sh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

export SSH_KEY_PATH="~/.ssh/rsa_id"

# Load aliases
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

alias ec='$EDITOR $HOME/.zshrc'

# Add cargo to the PATH
# source $HOME/.cargo/env

# asdf stuff
. "$HOME/.asdf/asdf.sh"

# Use nvim as the default editor
export EDITOR=nvim

# makes FZF use ripgrep (rg)
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob=!.git/'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

export ERL_AFLAGS="-kernel shell_history enabled"

export ELIXIR_EDITOR="code +__LINE__ __FILE__"

# Integrate fzf into the terminal
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

set t_Co=256

# enable vi mode
bindkey -v
