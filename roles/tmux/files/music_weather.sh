#!/usr/bin/env bash

music=$(osascript ~/dotfiles/roles/tmux/files/spotify.scpt)
weather=$(ansiweather -a false -u imperial -l "Reno,NV"  | cut -f1 -d "-" | sed 's/Current weather in Reno //g' | sed 's/=> //')

if [[ $music ]]; then
  echo "$music |$weather"
else
  echo "$weather"
fi;
