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
  ZSH_TMUX_AUTOSTART=true
fi

HISTSIZE=10000
SAVEHIST=10000

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
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

export ERL_AFLAGS="-kernel shell_history enabled"

export ELIXIR_EDITOR="code +__LINE__ __FILE__"

# Integrate fzf into the terminal
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

set t_Co=256

# enable vi mode
bindkey -v
