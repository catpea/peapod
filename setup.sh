#!/usr/bin/env bash

{

  setup() {
    ./setup/bluetooth.sh;
    ./setup/node.sh;
    ./setup/isir.sh;
    ./setup/daemon.sh;
  }

  if test -f .SETUP; then
    echo "ALREADY INSTALLED";
    exit
  fi;

  setup;
  date >> .SETUP
  # TODO: rm /etc/sudoers.d/010_peapod-nopasswd

}
