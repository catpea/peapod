#!/usr/bin/env bash
echo daemon setup...

read -d '' daemon <<_EOF_
[Unit]
Description=iSir Daemon
After=bluetooth.target

[Service]
ExecStart=/usr/bin/isir /dev/input/event1
Restart=on-failure
StandardOutput=syslog
User=peapod
Group=peapod

[Install]
WantedBy=multi-user.target
_EOF_

echo $daemon > /etc/systemd/system/isir-catpea.service


if systemctl --all --type service | grep -q "isir-catpea"; then
  systemctl --system daemon-reload
  systemctl enable isir-catpea
else
  systemctl restart isir-catpea
fi;

systemctl status isir-catpea

# notes
# systemctl list-units --type target
