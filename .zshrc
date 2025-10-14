# setting path for cargo bins
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# =================
# PYENV CONFIG
# =================
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="funky"

plugins=(
	git
	zsh-autosuggestions
	virtualenv
	aws
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"

pokemon-colorscripts --no-title -s -r | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -

alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'

# ==============
#    FZF 
# ==============
# set-up FZF key binding (CTRL R for fuzzy history finder)
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"
# fzf default for tmux
export FZF_TMUX_OPTS=" -p90%,70% "

# Setup fzf previews
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"

# ==============
#    TMUX 
# ==============
export TMUX_CONF=~/.config/tmux/tmux.conf
alias ta="tmux attach -t"
alias tl="tmux list-sessions"
alias tn="tmux new-session -s"
alias tk="tmux kill-session -t"

# ==============
#    MAN 
# ==============
alias fman="compgen -c | fzf | xargs man"

# ==============
#   Zoxide 
# ==============
eval "$(zoxide init zsh)"

# ==============
#   Yazi 
# ==============
# use y to use this so that the current directory changes when you use yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# ==============
#     NVM
# ==============
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # this loads nvm
[ -s "$NVM_DIR/bash_completions" ] && \. "$NVM_DIR/bash_completions" # this loads nvm bash_completions

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

alias vim='nvim'
alias ...='cd ../..'

