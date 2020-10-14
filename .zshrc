# This is a workaround for having a system node and NVM node
PATH="/usr/local/bin:$(getconf PATH)"

plugins=(aws brew docker git mix node npm osx pip pyenv tmux vi-mode yarn z)

HISTSIZE=10000
SAVEHIST=10000

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Open tmux_chooser on launch
# https://cedaei.com/posts/ideas-from-my-dev-setup-always-tmux/
if [[ ! -v TMUX && $TERM_PROGRAM != "vscode" ]]; then
  ./tmux_chooser.sh && exit
fi

ZSH_THEME="spaceship"
export SPACESHIP_VI_MODE_SHOW=true
export KEYTIMEOUT=1

export SSH_KEY_PATH="~/.ssh/rsa_id"

# Load aliases
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi
alias ec='$EDITOR $HOME/.zshrc'

# Add cargo to the PATH
source $HOME/.cargo/env

# Use nvim as the default editor
export EDITOR=nvim

export PATH="/Users/crenwick/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

# makes FZF use ripgrep (rg)
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

export ERL_AFLAGS="-kernel shell_history enabled"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Set Spaceship ZSH as a prompt
autoload -U promptinit
promptinit
prompt spaceship
