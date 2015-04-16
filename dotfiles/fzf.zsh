# Setup fzf
# ---------
if [[ ! "$PATH" =~ "/home/rlpowell/.fzf/bin" ]]; then
  export PATH="$PATH:/home/rlpowell/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" =~ "/home/rlpowell/.fzf/man" && -d "/home/rlpowell/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/home/rlpowell/.fzf/man"
fi

# Auto-completion
# ---------------
# [[ $- =~ i ]] && source "/home/rlpowell/.fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/home/rlpowell/.fzf/shell/key-bindings.zsh"

# We use ctrl-t already
zle     -N   fzf-file-widget
bindkey '\et' fzf-file-widget
