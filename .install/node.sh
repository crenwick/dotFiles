#!/bin/sh

echo "Installing global npm packages..."

npm install -g \
  n \
  eslint \
  eslint-config-airbnb-base \
  eslint-plugin-import \
  spaceship-prompt

# exit 0
