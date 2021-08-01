#!/usr/bin/env bash
echo daemon setup...

cp setup/daemon/isir-catpea.service /etc/systemd/system/isir-catpea.service

if systemctl --all --type service | grep -q "isir-catpea"; then
  systemctl --system daemon-reload
  systemctl enable isir-catpea
else
  systemctl restart isir-catpea
fi;

systemctl status isir-catpea

# notes
# systemctl list-units --type target
