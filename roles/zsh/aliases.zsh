# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# Syntax-highlighted cat (requires python-pygments)
# alias dog="pygmentize -g"

alias ls="ls --color=auto"
alias la="ls --color=auto -la"

alias cl="clear"
alias c="clear"
alias pg='ps -ef | grep'
alias lj='jobs'

alias reload!='. ~/.zshrc'
alias vi="vim"
alias v="vim"

alias dev="cd ~/Development"
