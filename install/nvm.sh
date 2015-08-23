#!/bin/sh

# reloead nvm into this environment
source $(brew --prefix nvm)/nvm.sh

nvm install stable
nvm install iojs
nvm alias default stable

# exit 0
