#!/usr/bin/env bash

music=$(osascript ~/dotfiles/roles/tmux/files/spotify.scpt)

if [[ $music ]]; then
  echo "$music"
fi;
