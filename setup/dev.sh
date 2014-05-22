#!/bin/bash

gem update --system
gem install ghi
gem install compass.takitapart.framework
  
npm install -g bower
npm install -g express
npm install -g docpad

# Powerline
pip install git+git://github.com/Lokaltog/powerline


# Sublime Text 3
# install sublime. run once.
# cd ~/Library/Application\ Support/Sublime\ Text\ 3
# rm -r Installed\ Packages
# rm -r Packages
# ln -s ~/Dropbox/Library/Application\ Support/Sublime\ Text\ 3/Installed\
# Packages/ ./Installed\ Packages
# ln -s ~/Dropbox/Library/Application\ Support/Sublime\ Text\ 3/Packages ./Packages

# vim
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
