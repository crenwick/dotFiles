export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="blinks"
plugsin=(git osx)

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

export ELIXIR_EDITOR="code +__LINE__ __FILE__"

# setup pyenv
# if which pyenv >/dev/null; then
#   eval "$(pyenv init - zsh --no-rehash)"
# fi
eval "$(pyenv init -)"

# Integrate fzf into the terminal
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## Prompt

ZSH_THEME_CLOUD_PREFIX='☁🚀 ☁'
ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""


PROMPT='%{%f%k%b%}
%{%B%F{green}%}%n%{%B%F{blue}%}@%{%B%F{cyan}%}%m%{%B%F{green}%} %{%b%F{yellow}%}%~%{%B%F{green}%}$(git_prompt_info)%E%{%f%k%b%}
%{%B%F{cyan}%}$ZSH_THEME_CLOUD_PREFIX %{%f%k%b%}› '

RPROMPT=''
RPROMPT2=''

set t_Co=256
