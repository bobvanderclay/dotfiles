# Install vundle
echo "Installing vundle..."
mkdir -p ~/.vim/bundle;
if [ ! -d "~/.vim/bundle/vundle" ]; \
then \
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim; \
fi

echo "Installing vim plugins..."
vim +BundleInstall +qall

