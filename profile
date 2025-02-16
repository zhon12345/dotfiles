# XDG Base Directories
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

[[ ! -d "$XDG_CONFIG_HOME" ]] && mkdir -p "$XDG_CONFIG_HOME"
[[ ! -d "$XDG_CACHE_HOME" ]] && mkdir -p "$XDG_CACHE_HOME"

# Environment Variables
export EDITOR='code'
export VISUAL='code'

# Aliases
alias ls='ls --color'
alias grep='grep --color'

# Functions
detect_os() {
	local uname_string="$(uname -a)"

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