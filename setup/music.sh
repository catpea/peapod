#!/usr/bin/env bash
echo setup shared directory

if test -d  /srv/music; then
    echo "Already setup /srv/music";
  else
    mkdir -p /srv/music
    chgrp -R music /srv/music
    chmod -R 2775 /srv/music
fi;
