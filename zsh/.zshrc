#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# Source Promptline.
if [ -f ~/.zsh/promptline.sh ]; then
  source ~/.zsh/promptline.sh
fi

# Needed in zsh < 5.0.5 to prevent space at end of RPROMPT.
ZLE_RPROMPT_INDENT=0 
# Fix ESC delay
KEYTIMEOUT=1
# Needed to force 256 color.
export TERM="xterm-256color"

# Aliases
alias dev='cd ~/Development'
