#!/usr/bin/env bash

{

  user() {
    if id peapod &>/dev/null; then
      echo 'Already created peapod.'
    else
      useradd --shell /bin/nologin --groups sudo,input --comment "Pea Pod" --create-home --home-dir /home/peapod peapod;
      echo 'peapod ALL=(ALL) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/010_peapod-nopasswd
      #NOTE: this user cannot login by standard means, use sudo -u peapod -s
      echo 'Created peapod'
    fi
  }

  setup() {
    sudo -u peapod sh -c "cd ~; if test -d peapod; then cd peapod; git pull; else git clone https://github.com/catpea/peapod.git; fi;"
    sudo -u peapod sh -c "cd ~/peapod; ./setup.sh"
  }

  install() {
    user;
    setup;
  }

  install;

}
