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

if [[ "$MACHINE" == "Android" ]]; then
	fastfetch -l small
else
	fastfetch
fi