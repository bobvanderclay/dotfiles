# Shell script to handle all non-privledged portions of the 
# Vagrant machine setup.

# Install homesick 
homesick clone takitapart/dotfiles
homesick symlink dotfiles

# Install vundle
echo "Installing vundle..."
if [ ! -d "~/.vim/bundle" ]; \
then \
  mkdir ~/.vim/bundle; \
fi
if [ ! -d "~/.vim/bundle/vundle" ]; \
then \
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim; \
fi

echo "Installing vim plugins..."
vim +BundleInstall +qall

echo "Configuring zsh..."
echo "vagrant" | chsh -s /bin/zsh

# Post-setup.

# Make Development directory.
if [ ! -d "~/Development" ]; \
then \
  mkdir ~/Development; \
fi

