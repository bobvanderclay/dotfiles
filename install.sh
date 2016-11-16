#!/usr/bin/env bash

# Ask for the administrator password upfront
if sudo grep -q "# %wheel\tALL=(ALL) NOPASSWD: ALL" "/etc/sudoers"; then

  # Ask for the administrator password upfront
  bot "I need you to enter your sudo password so I can install some things:"
  sudo -v

  # Keep-alive: update existing sudo time stamp until the script has finished
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
fi

DOTFILES_ROOT="`pwd`"

# Process each directory.
for folder in `find $DOTFILES_ROOT -mindepth 1 -maxdepth 1 -type d`
do

  echo "Processing: $folder"

  # Link dotfiles
  for dotfile in `find $folder -mindepth 1 -maxdepth 1 -name ".*"`
  do
    echo "    ln: "$(basename "$dotfile")
    ln -s $dotfile $HOME/$(basename "$dotfile")
  done

  # Run installer script
  find $folder -name "install.sh" | while read installer
  do
    bash "${installer}" > /dev/null
  done

done
