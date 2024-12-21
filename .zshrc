# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source /home/pieers/.oh-my-zsh/custom/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# use main_home to target only in your main user
# use $HOME to target per-user home
main_home="/home/pieers"

# -- zsh options
# https://zsh.sourceforge.io/Doc/Release/Options.html

setopt autocd # no need to write `cd` to change a directory

# -- nice word jumping and deleting

autoload -U select-word-style
select-word-style bash
export WORDCHARS=''
bindkey "^[[1;5C" forward-word # ctrl + right
bindkey "^[[1;5D" backward-word # ctrl + left
bindkey "^H" backward-delete-word # ctrl + backspace
bindkey '^[[3;5~' delete-word # ctrl + delete

# -- Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# -- colors for less
export LESS='-R --use-color -Dd+r$Du+b'

# -- disable microsoft spyware for dotnet
export DOTNET_CLI_TELEMETRY_OPTOUT="1"

# -- fly.io cli
export FLYCTL_INSTALL="$main_home/.fly"

# -- some tools setup
export GOPATH="$main_home/.local/go"
export JAVA_HOME="/home/pieers/opt/jdk-23"
export PNPM_HOME="/home/pieers/.config/local/share/pnpm"
export DENO_INSTALL="$main_home/.deno"
export BUN_INSTALL="$main_home/.bun"

export GITIN_LINESIZE=15
export GITIN_VIMKEYS=false

# -- Manual aliases
# alias ls='lsd'
# alias ls='lsd --group-dirs=first'
# alias ll='ls -lh'
# alias lla='ls -lha'
# alias la='ls -a'
# alias cat='batcat --theme=TwoDark'
alias dots="/usr/bin/git --work-tree=$HOME --git-dir=$HOME/.dotfiles"
alias gitin='gitin status'
alias grep='grep --color=always'
alias gc='git commit -v'
alias gca='git commit -v --amend'

# reverse path alias 'cd ..'
for i in {1..10}; do
  dots_alias=$(printf '.%.0s' {0..$i})
  cd_command="cd $(printf '../%.0s' {1..$i})"
  alias $dots_alias=$cd_command
done

if which kitty >/dev/null 2>&1; then
	alias ssh="kitty +kitten ssh"
	alias icat="kitty +kitten icat"
fi

# -- utilities

cap () { tee /tmp/capture.out; }
ret () { cat /tmp/capture.out; }

mkgo () { mkdir $1 && cd $1 }

paths=(
  /usr/local/bin
  /usr/local/go/bin
  /snap/bin
  $HOME/.local/bin
  $main_home/.config/local/share/fnm
  $main_home/.config/local/share/coursier/bin
  $HOME/.local/bin
  $PNPM_HOME
  $main_home/.dotnet
  $main_home/.scripts
  $FLYCTL_INSTALL/bin
  $DENO_INSTALL/bin
  $BUN_INSTALL/bin
)

for p in ${(Oa)paths}; do
  PATH=:$PATH:
  PATH=$p${PATH//:$p:/:}
  PATH=${PATH%:}
done

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/es
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# -- load plugins

# . ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
# . ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
# . ~/.zsh/zsh-completions/zsh-completions.plugin.zsh
# . ~/.zsh/completion.zsh
# . ~/.zsh/zsh-history.zsh
# . ~/.zsh/sudo.plugin.zsh
# . ~/.zsh/.fzf.zsh

# source .oh-my-zsh/custom/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  fast-syntax-highlighting
  zsh-completions
  # command-time
  # zsh-complete
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

export PATH=$PATH:/usr/sbin
export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"
export PATH="/home/pieers/Software:$PATH"
export PATH="/home/pieers/opt/jdk-23/bin:$PATH"
export PATH="/home/pieers/opt/gradle-8.10.1/bin/:$PATH"
# export PATH="/home/pieers/Software/pseint/bin:$PATH"
export PATH="/home/pieers/Software/sowon/:$PATH"
export PATH="/bin/scripts/:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias dotfiles=/usr/bin/git --work-tree=$HOME --git-dir=$HOME/.dotfiles
