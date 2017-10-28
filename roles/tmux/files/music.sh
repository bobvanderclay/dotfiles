#!/usr/bin/env bash

# music=$(osascript ~/dotfiles/roles/tmux/files/spotify.scpt)
music=$(osascript ~/dotfiles/roles/tmux/files/itunes.scpt)

if [[ $music ]]; then
  echo "$music"
fi;
