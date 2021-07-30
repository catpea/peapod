#!/usr/bin/env bash
echo Bluetooth Remote Setup
if bluetoothctl paired-devices | grep --quiet '11:22:34:3B:E7:3C'; then
  echo "Already paired the Beauty-R1 device"
else
  if ! command -v expect &> /dev/null; then
    run apt-get -y install expect
  fi
  ./setup/bluetooth.expect
fi
