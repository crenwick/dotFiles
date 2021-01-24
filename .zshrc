export ZSH="$HOME/.oh-my-zsh"

plugins=(brew docker git mix node npm osx pip pyenv tmux vi-mode yarn z)

HISTSIZE=10000
SAVEHIST=10000

export SPACESHIP_VI_MODE_SHOW=true
export KEYTIMEOUT=1

source $ZSH/oh-my-zsh.sh

# This is a workaround for having a system node and NVM node
PATH="/usr/local/bin:$(getconf PATH)"

# Open tmux_chooser on launch
# https://cedaei.com/posts/ideas-from-my-dev-setup-always-tmux/
if [[ ! -v TMUX && $TERM_PROGRAM != "vscode" ]]; then
  ./tmux_chooser.sh && exit
fi

export SSH_KEY_PATH="~/.ssh/rsa_id"

# # Load aliases
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi
alias ec='$EDITOR $HOME/.zshrc'

# Add cargo to the PATH
source $HOME/.cargo/env

# Use nvim as the default editor
export EDITOR=nvim

# makes FZF use ripgrep (rg)
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

export ERL_AFLAGS="-kernel shell_history enabled"

export PATH="/Users/crenwick/.pyenv/bin:$PATH"
if which pyenv > /dev/null; then
  eval "$(pyenv init - zsh --no-rehash)"
fi

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/charlol/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/charlol/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/charlol/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/charlol/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

