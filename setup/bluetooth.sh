#!/usr/bin/env bash
echo bluetooth setup...

if [ $(bluetoothctl paired-devices | grep 'Device 11:22:34:3B:E7:3C Beauty-R1') ]; then
  echo "Already paired Beauty-R1 device"
else
  echo run apt-get -y install expect
  echo run ./setup/bluetooth.expect
fi
