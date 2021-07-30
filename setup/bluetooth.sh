#!/usr/bin/env bash
if bluetoothctl paired-devices | grep --quiet '11:22:34:3B:E7:3C'; then
  echo "Already paired the Beauty-R1 device"
else
  echo Configuring bluetooth decice.
  if ! command -v expect &> /dev/null; then
    run apt-get -y install expect
  fi
  ./setup/bluetooth.expect
fi

# Beauty-R1 NOTES
# After scan on you need these:
# #bluetoothctl trust 11:22:34:3B:E7:3C;
# #bluetoothctl pair 11:22:34:3B:E7:3C;
# #bluetoothctl connect 11:22:34:3B:E7:3C;
#
# But! you must wait for them to finish!
# trust is optional,
# wait for pair to finish before running connect in expect do a wait 1, on the shell just run one after the other.
