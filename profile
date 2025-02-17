# XDG Base Directories
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

[ ! -d "${XDG_CONFIG_HOME}" ] && mkdir -p "${XDG_CONFIG_HOME}"
[ ! -d "${XDG_CACHE_HOME}" ] && mkdir -p "${XDG_CACHE_HOME}"

# NVM
export NVM_DIR="${XDG_CONFIG_HOME}/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# PATH Configuration
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Environment Variables
export EDITOR='code'
export VISUAL='code'

# Aliases
alias ll='ls -alF'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Functions
detect_os() {
	uname_string="$(uname -a)"

	case "$uname_string" in
			*Darwin*)			MACHINE="macOS";;
			*Linux*)			MACHINE="Linux";;
			*Msys*)				MACHINE="Windows";;
			*Cygwin*)			MACHINE="Windows";;
			*Android*)		MACHINE="Android";;
			*)						MACHINE="Unknown:${uname_string}";;
	esac

	export MACHINE
}

detect_os
