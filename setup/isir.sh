#!/usr/bin/env bash

if command -v isir &> /dev/null; then
  echo "Already installed isir";
  exit;
fi

echo Installing isir
npm i -g isir
