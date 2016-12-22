alias c='clear'
alias g='git'
alias ls='ls -GFh'

alias cdg='cd ~/Grove && cd ./'
alias cdd='cd ~/Documents/'

alias npmlist='npm list -g --depth=0'

alias hideDesktopFiles='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'
alias showDesktopFiles='defaults write com.apple.finder CreateDesktop -bool true && killall Finder'
alias showAllFiles='defaults write com.apple.finder AppleShowAllFiles YES'
alias hideAllFiles='defaults write com.apple.finder AppleShowAllFiles YES'
alias ddd='rm -rf ~/Library/Developer/Xcode/DerivedData/*'

set -o vi # set termainal to vi mode

export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
# export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
# export PATH="$HOME/.composer/vendor/bin:$PATH"
export PS1="\[\033[36m\]\u\[\033[m\]:\[\033[33;1m\]\w\[\033[m\]\[\033[36m\]\[\033[m\]$ "

# Git configuration
export EDITOR=nvim
export VISUAL=code

GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_THEME=Single_line
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

# nvm
# Only loads nvm when `node` or `npm` is called for the first time:
alias load_nvm='export NVM_DIR="$HOME/.nvm" && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'
alias node='unalias node npm && load_nvm && node'
alias npm='unalias node npm && load_nvm && npm'
# alias nvm='unalias node npm && load_nvm && nvm'
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Python imports
export PYTHONPATH=:$PYTHONPATH

# PHP imports
# export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
# export PATH="$HOME/.composer/vendor/bin:$PATH"

# Swift REPL
# export TOOLCHAINS=swift

# example: `$ gi node,osx`
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# example: `$ weather seattle`
function weather { wget -O - http://wttr.in/$1 -q; }
