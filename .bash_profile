source ~/.git-prompt.sh
alias cl='clear'
alias g='git status'
alias cdg='cd ~/Grove'

alias twit='source ~/Documents/venv/bin/activate; rainbowstream'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim -g'

export PS1="\[\033[36m\]\u\[\033[m\]:\[\033[33;1m\]\w\[\033[m\]\[\033[36m\]\$(__git_ps1)\[\033[m\]$ "
export PATH="/usr/local/git/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:$PATH"

alias ls='ls -GFh'
alias mongoRunning='ps -ax | grep mongo'
alias hideDesktopFiles='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'
alias showDesktopFiles='defaults write com.apple.finder CreateDesktop -bool true && killall Finder'
alias showAllFiles='defaults write com.apple.finder AppleShowAllFiles YES'
alias hideAllFiles='defaults write com.apple.finder AppleShowAllFiles YES'

export VISUAL='/Applications/MacVim.app/Contents/MacOS/Vim -g -f'
export EDITOR="$VISUAL"

export NVM_DIR="/Users/crenwick/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2376
export DOCKER_CERT_PATH=/Users/crenwick/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
