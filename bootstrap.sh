#!/bin/bash

DOTFILES_ROOT="`pwd`"

# Process each directory.
for folder in `find $DOTFILES_ROOT -mindepth 1 -maxdepth 1 -type d` 
do

  echo "Initializing: $folder"

  # Link dotfiles
  for dotfile in `find $folder -mindepth 1 -maxdepth 1 -name ".*"`
  do
    echo "Linking: "$(basename "$dotfile")
    ln -s $dotfile $HOME/$(basename "$dotfile")
  done

  # Run installer script
  find $folder -name "install.sh" | while read installer
  do 
    echo "Running installer";
    bash "${installer}" > /dev/null
  done

done
