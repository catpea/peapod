#!/usr/bin/env bash

{

  setup() {
    ./setup/node.sh;
    ./setup/music.sh;
    ./setup/isir.sh;
    ./setup/bluetooth.sh; # must be setup after isir as it uses isir to applu custom configuration things
    ./setup/daemon.sh; # fina step (note: possibly consider pm2 if manual setup causes problems)
  }

  if test -f .SETUP; then
    echo "Already setup peapod"; # TODO: tun the update here.
    exit
  fi;

  setup;
  date >> .SETUP
  # TODO: rm /etc/sudoers.d/010_peapod-nopasswd

}
