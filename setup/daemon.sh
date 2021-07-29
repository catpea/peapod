#!/usr/bin/env bash
echo daemon setup...

# daemon
# read -d '' daemon <<_EOF_
# [Unit]
# Description=iSir Daemon
#
# [Service]
# ExecStart=/usr/bin/isir /dev/input/event1
# Restart=on-failure
#
# [Install]
# WantedBy=multi-user.target
# _EOF_
#
# echo $daemon > /etc/systemd/system/isir.service
