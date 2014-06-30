#!/bin/bash

# Requirements:
# - git

######################################################################
# Git.
######################################################################
#echo " What's your Github username... (eg. takitapart)"
#  read GITHUB_USERNAME
#echo " What's your Github e-mail...   (eg. takitapart@gmail.com)"
#  read GITHUB_MAIL
#  
#echo "Checking for SSH key, generating one if it doesn't exist ..."
#  [[ -f ~/.ssh/id_rsa.pub ]] || ssh-keygen -t rsa -C "$GITHUB_MAIL" -f ~/.ssh/id_rsa
#
#echo "Copying public key to clipboard. Paste it into your Github account ..."
#  [[ -f ~/.ssh/id_rsa.pub ]] && cat ~/.ssh/id_rsa.pub | pbcopy
#  open https://github.com/settings/ssh
#
#echo "Setting git global defaults..."
#  git config --global user.name $GITHUB_USERNAME
#  git config --global user.email $GITHUB_MAIL
#  git config --global push.default simple
#  git config --global core.excludesfile ~/.gitignore
#  git config --global color.ui true
#
#echo "Accept Github fingerprint: (16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48)"
#  ssh -T git@github.com
#
######################################################################
# Homeshick, which will manage our dotfiles.
######################################################################
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
$HOME/.homesick/repos/homeshick/bin/homeshick clone https://github.com/takitapart/dotfiles.git

# Open the directory. 
cd $HOME/.homesick/repos/dotfiles
