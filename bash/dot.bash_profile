alias c='clear'
alias g='git'
alias ls='ls -GFh'

alias cdg='cd ~/Grove'
alias cdd='cd ~/Documents/'

alias npmlist='npm list -g --depth=0'
alias twit='source ~/Documents/venv/bin/activate; rainbowstream'
alias weather='wget -O - http://wttr.in/boston -q'

alias mongoRunning='ps -ax | grep mongo'
alias hideDesktopFiles='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'
alias showDesktopFiles='defaults write com.apple.finder CreateDesktop -bool true && killall Finder'
alias showAllFiles='defaults write com.apple.finder AppleShowAllFiles YES'
alias hideAllFiles='defaults write com.apple.finder AppleShowAllFiles YES'

# vim
export VISUAL='mvim -f -v'
export EDITOR="nvim"
# export GIT_EDITOR="$EDITOR"

# export PATH="/usr/local/git/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
export PS1="\[\033[36m\]\u\[\033[m\]:\[\033[33;1m\]\w\[\033[m\]\[\033[36m\]\[\033[m\]$ "

# Gitprompt configuration
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_THEME=Single_line
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

# nvm
# Only loads nvm when `node` or `npm` is called for the first time.
alias load_nvm='export NVM_DIR="$HOME/.nvm" && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'
alias node='unalias node npm && load_nvm && node'
alias npm='unalias node npm && load_nvm && npm'
