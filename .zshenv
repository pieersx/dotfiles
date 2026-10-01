# Variables XDG (las usan starship, mise, fzf, etc.)
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Rust/cargo
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# NOTA: el PATH se configura en ~/.zshrc (con tipos -U para no duplicar).
# Antes aquí había un "export PATH=..." que pisaba el PATH en cada shell.
