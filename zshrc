# Global Aliases & Commands
if [[ -f "${HOME}/.profile" ]]; then
	source ~/.profile
fi

# Plugin Manager
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
	ZINIT_HOME="${HOME}/.zinit/bin"
else
	ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
fi

if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# Theming
eval "$(oh-my-posh init zsh --config ~/.dotfiles/oh-my-posh/zhon12345.omp.json)"

# Keybinds
bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word

# History
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history
HISTDUP=erase

setopt inc_append_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
autoload -Uz compinit && compinit

# Functions
cleanup_cache() {
	local patterns=(
		".zsh_history.*"
		".zcompdump*"
	)

	for pattern in "${patterns[@]}"; do
		find "${HOME}" -maxdepth 1 -type f -name "${pattern}" -exec rm -f {} \;
	done
}

cleanup_cache