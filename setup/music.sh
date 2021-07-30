#!/usr/bin/env bash

if test -d  /srv/music; then
    echo "Already configured /srv/music";
  else
    echo "Setup Shared Music Directory (/srv/music)";
    mkdir -p /srv/music
    chgrp -R music /srv/music
    chmod -R 2775 /srv/music
fi;
