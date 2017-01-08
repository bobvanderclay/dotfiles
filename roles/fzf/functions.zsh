
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
