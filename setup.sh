#!/usr/bin/env bash

{

  setup() {
    ./setup/bluetooth.sh;
    ./setup/node.sh;
    ./setup/isir.sh;
    ./setup/daemon.sh;
    ./setup/music.sh;
    #TODO: consider pm2 maybe?
  }

  if test -f .SETUP; then
    echo "Already setup peapod"; # TODO: tun the update here.
    exit
  fi;

  setup;
  date >> .SETUP
  # TODO: rm /etc/sudoers.d/010_peapod-nopasswd

}
