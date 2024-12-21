# Setup fzf
# ---------
if [[ ! "$PATH" == */home/pieers/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/pieers/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/pieers/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/pieers/.fzf/shell/key-bindings.zsh"
