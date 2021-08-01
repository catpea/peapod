#!/usr/bin/env bash

if command -v isir &> /dev/null; then
  echo "Already installed isir";
  exit;
fi

echo "Installing iSir"
npm i -g isir conf

echo "Configuring iSir"
isir conf system options commands /home/peapod/peapod/commands

echo "Registering custom iSir commands"
isir conf macro play command play.sh
isir conf macro stop command stop.sh
isir conf macro next command list.sh next
isir conf macro prev command list.sh prev
isir conf macro loud command cans.sh loud
isir conf macro soft command cans.sh soft
