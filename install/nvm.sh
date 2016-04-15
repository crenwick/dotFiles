#!/bin/sh

# reloead nvm into this environment
echo "Installing node via nvm"

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

nvm_load
nvm install stable

# exit 0
