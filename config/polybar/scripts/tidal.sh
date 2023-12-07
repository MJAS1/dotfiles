#!/bin/bash
# Adjusted from: https://github.com/Mastermindzh/dotfiles/tree/master

TIDAL_CLI=~/bin/tidal-cli.sh
case $BLOCK_BUTTON in
1) "$TIDAL_CLI" playpause ;; # left click
4) "$TIDAL_CLI" next ;; # scroll up
5) "$TIDAL_CLI" previous ;; # scroll down
esac

if "$TIDAL_CLI" status | grep 'paused' >/dev/null; then
  printf ' ' # fa-pause
else
  printf ' ' # fa-play
fi
"$TIDAL_CLI" info
