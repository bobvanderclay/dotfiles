# Better path for Homebrew.
set -x PATH /usr/local/bin $PATH

# Git integration
set __fish_git_prompt_show_informative_status ‘yes’
set __fish_git_prompt_color_branch yellow
function fish_prompt
 set last_status $status
 set_color $fish_color_cwd
 printf '%s' (prompt_pwd)
 set_color normal
 printf '%s ' (__fish_git_prompt)
 set_color normal
end


alias l 'ls -la'
alias g git
alias cd.. 'cd ..'
alias .. 'cd ..'
alias vi vim

set -x EDITOR vim