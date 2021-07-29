# peapod
Installation/deployment repository for the Cat Pea music player.

## Installation

To install peapod, you should run the install script.

To do that, login to your device ssh pi@venus and issue the following cURL or Wget command:

```sh

sudo sh -c 'curl -o- https://raw.githubusercontent.com/catpea/peapod/main/install.sh | bash'

```

```sh

sudo sh -c 'wget -qO- https://raw.githubusercontent.com/catpea/peapod/main/install.sh | bash'

```

### Warning

This script adds a new user to your system and alters system configuration. Run at your own risk.
peapod comes with ABSOLUTELY NO WARRANTY, to the extent permitted by applicable law.
