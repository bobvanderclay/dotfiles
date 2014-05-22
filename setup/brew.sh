#!/bin/bash

brew_path=`which brew`
if [[ ! -f $brew_path ]]
then 
  echo "Installing Homebrew, a good OS X package manager..."
    ruby <(curl -fsS https://raw.github.com/mxcl/homebrew/go)
fi

echo "Putting Homebrew location earlier in PATH ..."
  # echo "export PATH='/usr/local/bin:\$PATH'" >> ~/.zshrc
  export PATH=/usr/local/bin:$PATH #temporary on bash

echo "Upda-grading Homebrew..."
  brew update
  brew upgrade

# echo "Hipsterizing your terminal with homebrewed zsh + Oh my zsh!"
  # brew install zsh
  # curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

echo "Installing homebrew-cask... (easy .app install automation)"
  brew tap phinze/homebrew-cask
  brew install brew-cask
  # mkdir -p /usr/local/Library/Taps/my-casks/
  # ln -s $SCRIPT_DIR/Casks /usr/local/Library/Taps/my-casks/Casks

echo "Updating some tools, adding some others..."
  brew install coreutils
  # echo "export PATH=/usr/local/opt/coreutils/libexec/gnubin:\$PATH" >> ~/.zshrc
  # echo "export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:\$MANPATH" >> ~/.zshrc
  brew install git
  brew install imagemagick --with-webp
  brew install lynx
  brew install nmap
  brew install node
  brew install unrar
  brew install hub
  brew install tmux
  brew install macvim
  brew install storm
  brew install redis

echo "Installing essential software..."
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"
  
  brew cask install adobe-creative-cloud
  brew cask install alfred
  brew cask install calibre
  brew cask install crashplan
  brew cask install daisydisk
  brew cask install dropbox
  # brew cask install evernote
  brew cask install fontexplorer-x-pro
  brew cask install github
  brew cask install google-chrome
  brew cask install hazel
  brew cask install iterm2
  brew cask install mamp
  brew cask install radiant-player
  brew cask install sketchup
  # brew cask install skitch
  brew cask install skype
  brew cask install sonos
  brew cask install steam
  brew cask install sublime-text
  brew cask install textexpander
  brew cask install the-unarchiver
  brew cask install transmission
  brew cask install vlc
  # brew cask install bartender
  # brew cask install bettertouchtool
  # brew cask install slack
  
echo "Cleaning up..."
  brew cleanup
