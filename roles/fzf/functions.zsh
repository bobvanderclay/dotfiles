
# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# tv - find / play TV show using mpv.
# TODO: crossplatform.
tv() {
    local file
    file=$(find /Volumes/media/Television -type f -not -path "*/.AppleDouble*" \( -iname "*.mkv" -o -iname "*.avi" -o -iname "*.m4v" \) 2> /dev/null |\
        fzf +m --select-1 --exit-0 -q "$*") && mpv "$file"
}

# If current selection is a text file shows its content,
# if it's a directory shows its content, the rest is ignored
FZF_CTRL_T_OPTS="--preview-window wrap --preview '
if [[ -f {} ]]; then
    file --mime {} | grep -q \"text\/.*;\" && bat {} || (tput setaf 1; file --mime {})
elif [[ -d {} ]]; then
    exa -l --color always {}
else;
    tput setaf 1; echo YOU ARE NOT SUPPOSED TO SEE THIS!
fi'"
