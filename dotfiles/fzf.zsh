# Setup fzf
# ---------
if [[ ! "$PATH" =~ "/home/rlpowell/src/fzf/bin" ]]; then
  export PATH="$PATH:/home/rlpowell/src/fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" =~ "/home/rlpowell/src/fzf/man" && -d "/home/rlpowell/src/fzf/man" ]]; then
  export MANPATH="$MANPATH:/home/rlpowell/src/fzf/man"
fi

# Auto-completion
# ---------------
# [[ $- =~ i ]] && source "/home/rlpowell/src/fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/home/rlpowell/src/fzf/shell/key-bindings.zsh"

