# Global Aliases & Commands
if [[ -f "${HOME}/.profile" ]]; then
	source ~/.profile
fi

# Keybinds
bind '"\C-h": backward-kill-word'
bind '"\e[3;5~":kill-word'

# History
HISTSIZE=5000
HISTFILESIZE=$HISTSIZE
HISTFILE=~/.bash_history
HISTCONTROL=ignoreboth:erasedups

shopt -s histappend

HISTIGNORE='&:[ ]*'
PROMPT_COMMAND="history -a; history -n"

# Theming
eval "$(oh-my-posh init bash --config ~/.dotfiles/oh-my-posh/zhon12345.omp.json)"