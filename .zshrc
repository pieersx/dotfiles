# ============================================================
#  ~/.zshrc — Oh My Zsh + Starship + mise + fzf + zoxide + atuin
# ============================================================

export ZSH="$HOME/.oh-my-zsh"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

ZSH_THEME=""

# Recordar actualizaciones de omz sin auto-actualizar
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 7

# --- Plugins ---------------------------------------------------
# Orden: syntax-highlighting debe ir después de autosuggestions y
# antes de history-substring-search (este se engancha a aquel).
plugins=(
  git
  sudo              # Esc Esc -> anteponer sudo al comando actual
  extract           # x <archivo.zip|tar.gz|...> extrae cualquier formato
  dirhistory        # Alt+←/→ sube/baja en la historia de directorios
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-history-substring-search
  zsh-completions
)

source "$ZSH/oh-my-zsh.sh"

# --- Historial robusto ----------------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt EXTENDED_HISTORY          # timestamp en cada entrada
setopt INC_APPEND_HISTORY        # escribe inmediatamente (no al salir)
setopt SHARE_HISTORY             # compartido entre sesiones simultáneas
setopt HIST_IGNORE_DUPS          # no duplicar consecutivos
setopt HIST_IGNORE_SPACE         # ' cmd' queda fuera del historial
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY               # !! muestra el comando antes de ejecutar
setopt HIST_FIND_NO_DUPS

# --- Navegación -----------------------------------------------
setopt AUTO_CD                   # 'dev' -> cd dev
setopt AUTO_PUSHD PUSHD_IGNORE_DUPS PUSHD_SILENT   # cd deja pila, 'cd -' / 'popd'
setopt CORRECT                   # corrige typos: 'apt udpate' -> 'apt update'?
setopt INTERACTIVE_COMMENTS      # # comenta en la línea de comandos
unsetopt FLOW_CONTROL            # libera Ctrl+S / Ctrl+Q
setopt NO_BEEP

# --- PATH (sin duplicados) -------------------------------------
typeset -U path fpath
path=(
  "$HOME/.local/bin"
  "$HOME/.atuin/bin"
  "$HOME/.cargo/bin"
  "$HOME/.nimble/bin"
  "$HOME/.opencode/bin"
  $path
)
export PATH

# --- Editor ----------------------------------------------------
export EDITOR="micro"                       # terminal (instalado)
export VISUAL="code --wait"                 # GUI; git usa VISUAL/EDITOR
export TERMINAL="kitty"

# --- Modern CLI tools ------------------------------------------
# fd (fd-find en Debian)
if (( $+commands[fdfind] )); then
  alias fd='fdfind'
fi

# bat (batcat en Debian)
if (( $+commands[batcat] )); then
  alias cat='batcat --paging=never'
  export BAT_THEME="Visual Studio Dark+"
elif (( $+commands[bat] )); then
  alias cat='bat --paging=never'
fi

# eza
if (( $+commands[eza] )); then
  alias ls='eza --group-directories-first'
  alias ll='eza -la --git --icons --group-directories-first'
  alias lt='eza --tree --level=2 --git-ignore'
fi

# Aliases de uso general
alias ..='cd ..'
alias ...='cd ../..'
alias reload='source ~/.zshrc'
alias zshconfig='${VISUAL:-code} ~/.zshrc'
alias update='sudo apt update && sudo apt upgrade'
alias ports='ss -tulpn'

# --- fzf (Ctrl+T archivos, Alt+C directorios) -------------------
# Ctrl-R lo maneja atuin (se inicializa después y gana la tecla)
export FZF_DEFAULT_OPTS='--exact --height=60% --layout=reverse --info=inline --border=rounded'
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'batcat -n --color=always --line-range :200 {} 2>/dev/null || bat -n --color=always --line-range :200 {}'"

for _fzf in \
  /usr/share/doc/fzf/examples/key-bindings.zsh \
  /usr/share/doc/fzf/examples/completion.zsh; do
  [[ -f $_fzf ]] && source $_fzf
done
unset _fzf

# --- zoxide (z <fragmento> salta a directorios frecuentes) -----
(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"

# --- atuin (historial cifrado, Ctrl-R con búsqueda difusa) -----
if [[ -x "$HOME/.atuin/bin/atuin" ]]; then
  eval "$("$HOME/.atuin/bin/atuin" init zsh)"
fi

# --- Prompt y runtimes -----------------------------------------
eval "$(starship init zsh)"
eval "$(mise activate zsh)"
