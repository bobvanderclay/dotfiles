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
# echo " What's your Github username... (eg. takitapart)"
#   read GITHUB_USERNAME
# echo " What's your Github e-mail...   (eg. takitapart@gmail.com)"
#   read GITHUB_MAIL
#   
# echo "Checking for SSH key, generating one if it doesn't exist ..."
#   [[ -f ~/.ssh/id_rsa.pub ]] || ssh-keygen -t rsa -C "$GITHUB_MAIL" -f ~/.ssh/id_rsa
# 
# echo "Copying public key to clipboard. Paste it into your Github account ..."
#   [[ -f ~/.ssh/id_rsa.pub ]] && cat ~/.ssh/id_rsa.pub | pbcopy
#   open https://github.com/settings/ssh
# 
# echo "Setting git global defaults..."
#   git config --global user.name $GITHUB_USERNAME
#   git config --global user.email $GITHUB_MAIL
#   git config --global push.default simple
#   git config --global core.excludesfile $DIR/git/.gitignore_global
#   git config --global color.ui true
# 
# echo "Accept Github fingerprint: (16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48)"
#   ssh -T git@github.com

######################################################################
# Homesick, which will manage our dotfiles.
######################################################################
homesick clone takitapart/dotfiles-dev
homesick symlink dotfiles-dev
~/.homesick/repos/dotfiles-dev/setup/test.sh

######################################################################
# Homebrew.
######################################################################
# brew_path=`which brew`
# if [[ ! -f $brew_path ]]
# then 
#   echo "Installing Homebrew, a good OS X package manager..."
#     ruby <(curl -fsS https://raw.github.com/mxcl/homebrew/go)
# fi
# 
# echo "Putting Homebrew location earlier in PATH ..."
#   # echo "export PATH='/usr/local/bin:\$PATH'" >> ~/.zshrc
#   # export PATH=/usr/local/bin:$PATH #temporary on bash
# 
# echo "Upda-grading Homebrew..."
#   brew update
#   brew upgrade

echo "Hipsterizing your terminal with homebrewed zsh + Oh my zsh!"
  # brew install zsh
  # curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

echo "Installing homebrew-cask... (easy .app install automation)"
  # brew tap phinze/homebrew-cask
  # brew install brew-cask
  # mkdir -p /usr/local/Library/Taps/my-casks/
  # ln -s $SCRIPT_DIR/Casks /usr/local/Library/Taps/my-casks/Casks

echo "Updating some tools, adding some others..."
  # brew install coreutils
  # echo "export PATH=/usr/local/opt/coreutils/libexec/gnubin:\$PATH" >> ~/.zshrc
  # echo "export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:\$MANPATH" >> ~/.zshrc
  # brew install git
  # brew install unrar

echo "Installing essential software..."
  #export HOMEBREW_CASK_OPTS="--appdir=/Applications"
  # brew cask install dropbox
  # brew cask install the-unarchiver
  # brew cask install google-chrome
  # brew cask install vlc
  # brew cask install spotify
  # brew cask install open-office
  # brew cask install skype
  # brew cask install cyberduck
  # brew cask install bartender
  # brew cask install bettertouchtool
  # brew cask install coconutbattery
  # brew cask install daisydisk

######################################################################
# 
######################################################################



######################################################################
# 
######################################################################



######################################################################
# 
######################################################################
