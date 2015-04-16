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
[[ $- =~ i ]] && source "/home/rlpowell/.fzf/shell/completion.bash"

# Key bindings
# ------------
source "/home/rlpowell/.fzf/shell/key-bindings.bash"

# We already use C-t.  Untested.
bind '"\et": " \C-u \C-a\C-k$(__fsel_tmux)\e\C-e\C-y\C-a\C-d\C-y\ey\C-h"'
