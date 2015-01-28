source ~/.git-prompt.sh
alias cl='clear'
alias g='git status'
alias cdf='cd ~/Documents/Codefellows'
alias rainbowstream='rainbowstream -iot'
export PS1="\[\033[36m\]\u\[\033[m\]:\[\033[33;1m\]\w\[\033[m\]\[\033[36m\]\$(__git_ps1)\[\033[m\]$ "
alias ls='ls -GFh'
alias mongoRunning='ps -ax | grep mongo'
