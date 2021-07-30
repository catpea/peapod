#!/usr/bin/env bash
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi
gpasswd -d peapod music
userdel peapod;
rm -fr /home/peapod;
rm -fr /srv/music
gpasswd -d pi music
groupdel music

echo this program will not remove nodejs installation becasue it is useful

# TODO remove service
