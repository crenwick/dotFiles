export ZSH="$HOME/.oh-my-zsh"

plugins=(brew docker git mix node npm macos pip tmux vi-mode yarn z)

HISTSIZE=10000
SAVEHIST=10000

export SPACESHIP_VI_MODE_SHOW=true
export KEYTIMEOUT=1

source $ZSH/oh-my-zsh.sh

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

# setup pyenv
# if which pyenv >/dev/null; then
#   eval "$(pyenv init - zsh --no-rehash)"
# fi
eval "$(pyenv init -)"

# Set Spaceship ZSH as a promfpt
autoload -U promptinit
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

promptinit
prompt spaceship

# Integrate fzf into the terminal
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
