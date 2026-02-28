# XDG Base Directories
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

[ ! -d "${XDG_CONFIG_HOME}" ] && mkdir -p "${XDG_CONFIG_HOME}"
[ ! -d "${XDG_CACHE_HOME}" ] && mkdir -p "${XDG_CACHE_HOME}"


# PATH Configuration
declare -a paths=(
	"${HOME}/.local/bin"
	"${HOME}/.local/share/fnm"
)

for dir in "${paths[@]}"; do
	if [ -d "$dir" ] && [[ ":$PATH:" != *":$dir:"* ]]; then
		PATH="${dir}:${PATH}"
	fi
done

export PATH

# Environment Variables
if command -v code > /dev/null 2>&1; then
	export EDITOR='code --wait'
	export VISUAL='code --wait'
fi

# Aliases
alias ll='ls -alF'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Detect OS
case "$(uname -s)" in
	Darwin*) MACHINE="macOS" ;;
	Linux*)
		if [ -d "/data/data/com.termux" ]; then
			MACHINE="Android"
		elif grep -qi "microsoft" /proc/version 2>/dev/null; then
			MACHINE="WSL"
		else
			MACHINE="Linux"
		fi
		;;
	CYGWIN*|MSYS*|MINGW*) MACHINE="Windows" ;;
	*) MACHINE="Unknown" ;;
esac
export MACHINE
