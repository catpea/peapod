#!/usr/bin/env bash

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

{

  configure_group() {
    if [ $(getent group music) ]; then
      echo "Already created group music"
    else
      groupadd music
      usermod -a -G music pi
      echo 'Created music group'
    fi
  }

  configure_user() {
    if id peapod &>/dev/null; then
      echo 'Already created user peapod.'
    else
      useradd --shell /bin/nologin --groups sudo,input,music --comment "Pea Pod" --create-home --home-dir /home/peapod peapod;
      usermod -a -G music peapod # this allows access to MP3 files
      usermod -a -G audio peapod # this allows acces to audio devices
      echo 'peapod ALL=(ALL) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/010_peapod-nopasswd
      # NOTE: this user cannot login by standard means, use sudo -u peapod -s
      echo 'Created user peapod'
    fi
  }

  perform_setup() {
    sudo -u peapod sh -c "cd ~; if test -d peapod; then cd peapod; git pull; else git clone https://github.com/catpea/peapod.git; fi;"
    sudo -u peapod sh -c "cd ~/peapod; sudo ./setup.sh"
  }

  install() {
    configure_group;
    configure_user;
    perform_setup;
  }

  install;

}
