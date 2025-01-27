# Powerlevel10k Instant Prompt Initialization
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Main variables
export main_home="$HOME"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Powerlevel10k Theme Configuration
# ZSH_THEME="simple"

# Plugins for zsh
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-history-substring-search
  zsh-completions
  zsh-autocomplete
)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Load Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# PATH Configuration
paths=(
  /usr/local/bin
  /usr/local/share/rofi-emoji
  $main_home/.local/share/fnm
)

# Add paths to the global PATH
for p in $paths; do
  export PATH="$p:$PATH"
done

# FNM Configuration
FNM_PATH="/home/pieers/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/pieers/.local/share/fnm:$PATH"
  eval "`fnm env`"
  eval "`fnm completions --shell zsh`"
fi

# Aliases
eval "$(dircolors -b)"
alias ll='ls -lah --color=auto'
alias config-edit="code ~/.zshrc"
alias reload-zsh="source ~/.zshrc"
alias edit-i3="code ~/.config/i3/config"

# Zsh Auto-Suggestions Configuration
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan"

# Zsh Syntax Highlighting Configuration
ZSH_HIGHLIGHT_HIGHLIGHTERS=(
  main
  brackets
  pattern
)

# Optional Settings
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
HIST_STAMPS="yyyy-mm-dd"

# Corrección y autocompletado
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"

# Editor Configuration
export EDITOR="code"

# Customization for i3wm Environment
export TERMINAL="kitty"
alias terminal="$TERMINAL"

# Oh My Zsh Updates
zstyle ':omz:update' mode reminder   # Remind to update Oh My Zsh
zstyle ':omz:update' frequency 7   # Check for updates every 13 days

# Starship Prompt Initialization
eval "$(starship init zsh)"

# Enhancements for Starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
