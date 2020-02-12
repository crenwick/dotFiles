# Generates ctags for Python (with packages and libs dir)
function ctags_pip() {
  # Make magic
  ctags -R --exclude=.git --fields=+l --languages=python --python-kinds=-iv -f $1tags $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))")
}
function ctags_pip3() {
  # Make magic
  ctags -R --exclude=.git --fields=+l --languages=python --python-kinds=-iv -f $1tags $(python3 -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))")
}

# set termainal to vi mode
set -o vi

# enable `ctrl-s`
stty -ixon

# function promptCommand()
# {
#   LAST_STATUS=$GIT_PROMPT_LAST_COMMAND_STATE
#   if [ $LAST_STATUS -eq 0 ]; then
#     ((successes++))
#     echo -n "$successes"
#   else
#     successes=0
#   fi  
# }
# successes=-1
# PROMPT_COMMAND="promptCommand"

export HISTCONTROL=ignoreboth:erasedups # dont keep dups in bash histry
export HISTSIZE=2000
export HISTFILESIZE=4000

# Git configuration
export EDITOR=nvim
# export VISUAL=code

# GIT_PROMPT_THEME=Single_line
# if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
#   __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
#   source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
# fi

# example: `$ gi node,osx`
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# example: `$ weather seattle`
function weather { wget -O - http://wttr.in/$1 -q; }

# nvm
# Only loads nvm when `node` or `npm` is called for the first time:
# alias load_nvm='export NVM_DIR="$HOME/.nvm" && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'
# alias node='unalias node npm && load_nvm && node'
# alias npm='unalias node npm && load_nvm && npm'
# alias nvm='unalias node npm && load_nvm && nvm'
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"


# Python imports
export PYTHONPATH=:$PYTHONPATH

# Swift REPL
# export TOOLCHAINS=swift

# makes FZF use ripgrep (rg)
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

# Go
export PATH="$HOME/gocode/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# Rust
source $HOME/.cargo/env

export PS1="\[\033[36m\]\u\[\033[m\]:\[\033[33;1m\]\w\[\033[m\]\[\033[36m\]\[\033[m\]$ "
# export PATH="/usr/local/sbin:$PATH"
# export PATH="~/Library/Python/3.6/bin:$PATH"

export PATH="/Users/crenwick/.pyenv/bin:$PATH"
# CPPFLAGS="-I$(brew --prefix zlib)/include" pyenv install -v 3.7.2
eval "$(pyenv init -)"
# export WORKON_HOME="~/.virtualenv"
# export VIRTUALENVWRAPPER_PYTHON="/Users/crenwick/.pyenv/shims/python3"
# source "~/.local/bin/virualenvwrapper.sh"
# eval "$(pyenv virtualenv-init -)"
export ERL_AFLAGS="-kernel shell_history enabled"
