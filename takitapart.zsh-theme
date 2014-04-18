# takitapart theme 
# Use with a dark background and 256-color terminal!

DARKEST_BLUE=$FG[024]
DARK_BLUE=$FG[031]
MEDIUM_CYAN=$FG[117]

BRIGHT_ORANGE=$FG[208]
BRIGHTEST_ORANGE=$FG[214]

MEDIUM_RED=$FG[124]

STONE=$FG[243]
SNOW=$FG[253]

function _prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo ' '
}

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B$SNOW%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%B$STONE%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$MEDIUM_RED%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{%f%k%b%}
%{%B$MEDIUM_CYAN%}%n%{%B$DARKEST_BLUE%}@%{%B$DARK_BLUE%}%m%{%B%F{green}%} %{%b$BRIGHT_ORANGE%}%~%{%B$STONE%}$(git_prompt_info)%E%{%f%k%b%}
%{$DARK_BLUE%}$(_prompt_char) %{$STONE%}%#%{%f%k%b%} '

RPROMPT='!%{%B$STONE%}%!%{%f%k%b%}'
