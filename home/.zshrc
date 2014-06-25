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

# Source Promptline.
if [ -f ~/.zsh/promptline.sh ]; then
  source ~/.zsh/promptline.sh
fi

# Needed in zsh < 5.0.5 to prevent space at end of RPROMPT.
ZLE_RPROMPT_INDENT=0 
# Fix ESC delay
KEYTIMEOUT=1

# Aliases
alias dev='cd ~/Development'
alias tmux='tmux -2'
