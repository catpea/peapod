#!/usr/bin/env bash

if command -v node &> /dev/null; then
  echo "Already installed node";
  exit;
fi

echo Installing Node.js
TMP_DIR=`mktemp -d`;
cd $TMP_DIR;
wget wget https://unofficial-builds.nodejs.org/download/release/v14.13.0/node-v14.13.0-linux-armv6l.tar.xz
tar xvfJ node-v14.13.0-linux-armv6l.tar.xz
cp -R node-v14.13.0-linux-armv6l/* /usr/local
cd -;
rm -rf $TMP_DIR;

curl -f https://get.pnpm.io/v6.7.js | node - add --global pnpm

# Use these locations if something is broken.
# https://unofficial-builds.nodejs.org/download/release/v14.17.4/node-v14.17.4-linux-armv6l.tar.xz
# https://unofficial-builds.nodejs.org/download/release/v15.14.0/node-v15.14.0-linux-armv6l.tar.xz
# https://unofficial-builds.nodejs.org/download/release/v16.5.0/node-v16.5.0-linux-armv6l.tar.xz
