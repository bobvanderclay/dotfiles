#!/bin/bash

if [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
  # Copy fonts. There may be a .font directory already in place.
  mkdir -p ~/.fonts
  cp -f powerline-fonts/DroidSansMono/*.otf ~/.fonts 
  fc-cache -v
fi
