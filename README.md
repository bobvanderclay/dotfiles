# takitapart dotfiles (Version 4)

## Installing ##

### Mac ###

curl -s https://raw.githubusercontent.com/takitapart/dotfiles/master/bootstrap/mac | bash

### TODO ###

  - atom installed with sync-settings package

      ```bash
      apm install sync-settings
      ```
 
  - chsh zsh (mac).
  - zplug "zplug/zplug"
  - iterm config?
  - rustup (nightly)
  - cmake
  - replace npm with yarn
  - install webpack globally
  - elixir/phoenix
  - exa

      ```bash
      RUSTFLAGS="-C target-cpu=native" cargo install --git git://github.com/ogham/exa
      brew install openssl
      export OPENSSL_INCLUDE_DIR=`brew --prefix openssl`/include
      export OPENSSL_LIB_DIR=`brew --prefix openssl`/lib
      ```
