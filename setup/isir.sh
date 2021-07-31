#!/usr/bin/env bash

if command -v isir &> /dev/null; then
  echo "Already installed isir";
  exit;
fi

echo "Installing iSir"
npm i -g isir conf

echo "Registering custom iSir commands"
# Register custom iSir commands
isir conf command play execute play.sh
isir conf command stop execute stop.sh
isir conf command next execute list.sh next
isir conf command prev execute list.sh prev
isir conf command loud execute cans.sh loud
isir conf command soft execute cans.sh soft
