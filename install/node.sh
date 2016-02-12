#!/bin/sh

echo "Installing node"

brew install node

echo "Installing global npm packages..."

brew cask install iterm2

npm install -g babel
npm install -g babel-eslint
npm install -g eslint
npm install -g eslint-config-airbnb
npm install -g eslint-plugin-react
npm install -g nodemon
npm install -g particle-cli
npm install -g ungit

# exit 0
