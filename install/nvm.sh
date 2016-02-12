#!/bin/sh

# reloead nvm into this environment
echo "Installing node and iojs with nvm"
source $(brew --prefix nvm)/nvm.sh

nvm install stable
nvm install iojs
nvm alias default stable

# exit 0
