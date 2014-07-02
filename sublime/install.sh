#!/bin/bash

cd "$(dirname "$0")"

echo "    Installing Sublime Text preferences."

if [[ "$(uname)" == "Darwin" ]]; then
  # platform="osx"
  cp -r User/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User  
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
  # platform="linux"
  cp -r User/* ~/.config/sublime-text-2
elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]]; then
  # platform="windows"
  cp -r User/* %APPDATA%\Sublime Text 2
fi
