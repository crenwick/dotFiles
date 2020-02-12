#!/bin/sh

echo "Installing global npm packages..."

npm install -g \
  eslint \
  eslint-config-airbnb-base \
  eslint-plugin-import \
  nodemon \
  particle-cli \
  spaceship-prompt

# exit 0
