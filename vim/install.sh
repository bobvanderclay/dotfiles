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

