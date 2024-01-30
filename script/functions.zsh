# _functions.zsh is a file that contains all the functions that are used in the
# A function to search history using fzf and add the selected command to the buffer
_fzf_history_search() {
    BUFFER=$(history -n -r 1 | uniq | fzf --query "$LBUFFER" --reverse --height 40% --tiebreak=index)
    CURSOR=$#BUFFER
    zle reset-prompt
}
# A function to open the current directory in specified editor
_start_editing() {
  lvim
}
# A function to add a directory to the PATH if it exists and not in the PATH
binary() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="$1:$PATH"
  fi
}
