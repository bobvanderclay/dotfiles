#!/bin/bash

# Requirements:
#   - XCode Command Line tools.

# Sudo once.
echo "Root password needed to run OSX customization of settings:"
sudo -v

# Setup.
trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT
set -e


# Check that Xcode command line tools are already there
clang_path=`which clang`
if [[ ! -f $clang_path ]]
then
  echo -ne "\x1B[00;31mYou need XCode command line tools to proceed\n\x1B[00m"
  exit -1
fi

######################################################################
# Git.
######################################################################
echo " What's your Github username... (eg. takitapart)"
  read GITHUB_USERNAME
echo " What's your Github e-mail...   (eg. takitapart@gmail.com)"
  read GITHUB_MAIL
  
echo "Checking for SSH key, generating one if it doesn't exist ..."
  [[ -f ~/.ssh/id_rsa.pub ]] || ssh-keygen -t rsa -C "$GITHUB_MAIL" -f ~/.ssh/id_rsa

echo "Copying public key to clipboard. Paste it into your Github account ..."
  [[ -f ~/.ssh/id_rsa.pub ]] && cat ~/.ssh/id_rsa.pub | pbcopy
  open https://github.com/settings/ssh

echo "Setting git global defaults..."
  git config --global user.name $GITHUB_USERNAME
  git config --global user.email $GITHUB_MAIL
  git config --global push.default simple
  git config --global core.excludesfile ~/.gitignore
  git config --global color.ui true

echo "Accept Github fingerprint: (16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48)"
  ssh -T git@github.com

######################################################################
# Homesick, which will manage our dotfiles.
######################################################################
homesick clone takitapart/dotfiles
homesick symlink dotfiles

######################################################################
# Setup scripts.
######################################################################

######################################################################
# Homebrew.
######################################################################
bash ~/.homesick/repos/dotfiles/setup/brew.sh

######################################################################
# OSX Settings.
######################################################################
bash ~/.homesick/repos/dotfiles/setup/osx.sh

######################################################################
# Dev
######################################################################
bash ~/.homesick/repos/dotfiles/setup/dev.sh

######################################################################
# Change default shell to fish
######################################################################
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
echo "Changing default shell to fish."
chsh -s /usr/local/bin/fish

