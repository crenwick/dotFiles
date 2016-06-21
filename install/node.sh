#!/bin/sh

echo "Installing global npm packages..."

npm install -g \
  eslint \
  eslint-config-airbnb-base \
  eslint-plugin-import \
  nodemon \
  particle-cli \
  ungit

# exit 0
