#!/usr/bin/env bash
if bluetoothctl paired-devices | grep --quiet '11:22:34:3B:E7:3C'; then
  echo "Already paired the Beauty-R1 device"
else
  echo Configuring bluetooth decice.
  if ! command -v expect &> /dev/null; then
    apt-get -y install expect
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


# Connect Beauty-R1 patterns to commands:
isir conf pattern 525094d7-88aa-59ae-8e09-b2b3365f989d macro play
isir conf pattern a89c2671-be39-5096-a1a7-80d17125042c macro stop
isir conf pattern d772ad3d-830d-4bf9-8dde-df0d4836fea8 macro next
isir conf pattern b3a8f352-8686-4d43-beb9-df1c1f171ea9 macro prev
isir conf complex 322a9c06-e24b-4da2-8749-01f31fb2e494 macro loud
isir conf complex 354cd6ed-c4f6-4744-9b17-a1bffb72e325 macro soft
