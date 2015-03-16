source ~/.git-prompt.sh
alias cl='clear'
alias g='git status'
alias cdg='cd ~/Grove'
alias cdf='cd ~/Documents/Codefellows'
alias rainbowstream='rainbowstream -iot'
export PS1="\[\033[36m\]\u\[\033[m\]:\[\033[33;1m\]\w\[\033[m\]\[\033[36m\]\$(__git_ps1)\[\033[m\]$ "
export PATH="/usr/local/git/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:$PATH"
alias ls='ls -GFh'
alias mongoRunning='ps -ax | grep mongo'
alias hideDesktopFiles='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'
alias showDesktopFiles='defaults write com.apple.finder CreateDesktop -bool true && killall Finder'
alias showAllFiles='defaults write com.apple.finder AppleShowAllFiles YES'
alias hideAllFiles='defaults write com.apple.finder AppleShowAllFiles YES'
