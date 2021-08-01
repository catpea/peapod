#!/usr/bin/env bash

if command -v isir &> /dev/null; then
  echo "Already installed isir";
  exit;
fi

echo "Installing iSir"
npm i -g isir conf

sudo -u peapod ./setup/isir/commands.sh
