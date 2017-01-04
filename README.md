# takitapart dotfiles (Version 4)

## Installing ##

### Mac ###

curl -s https://raw.githubusercontent.com/takitapart/dotfiles/master/bootstrap/mac | bash

### TODO ###
- atom installed with sync-settings package
  ~~~
  apm install sync-settings
  ~~~
- chsh zsh (mac).
- zplug "zplug/zplug"
- iterm config?
- cmake
- rustup (nightly)
- cmake
- enhancd
- exa
    RUSTFLAGS="-C target-cpu=native" cargo install --git git://github.com/ogham/exa
    brew install openssl
    export OPENSSL_INCLUDE_DIR=`brew --prefix openssl`/include
    export OPENSSL_LIB_DIR=`brew --prefix openssl`/lib
