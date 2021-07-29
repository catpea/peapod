#!/usr/bin/env bash

{

  user() {
    if id peapod &>/dev/null; then
      echo 'peapea ready'
    else
      useradd --shell /bin/nologin --groups sudo,input --comment "Pea Pod" --create-home --home-dir /home/peapod peapod;
      echo 'peapod ALL=(ALL) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/010_peapod-nopasswd
      #NOTE: this user cannot login by standard means, use sudo -u peapod -s
      echo 'peapea ready'
    fi
  }

  setup() {

    sudo -u peapod sh -c "cd ~; git clone https://github.com/catpea/peapod.git;"
    sudo -u peapod sh -c "cd ~/peapod; ./setup.sh"
  }

  install() {
    user;
    setup;
  }

  install;

}
