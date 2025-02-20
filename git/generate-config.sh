#!/bin/bash

. ~/.profile

if [[ ! -d "${XDG_CONFIG_HOME}/git" ]]; then
	mkdir -p "${XDG_CONFIG_HOME}/git"
fi

declare -A git_config=(
	["user.name"]="zhon12345"
	["user.email"]="43035773+zhon12345@users.noreply.github.com"
	["core.autocrlf"]="input"
	["init.defaultBranch"]="main"
)

export GIT_CONFIG_GLOBAL="${XDG_CONFIG_HOME}/git/config"

for key in "${!git_config[@]}"; do
	git config --global "${key}" "${git_config[${key}]}"
done

if command -v code > /dev/null 2>&1; then
	git config --global core.editor "code --wait"
fi

if [[ "$(uname -a)" =~ "WSL" ]]; then
	git config --global credential.helper "/mnt/c/Program\\ Files/Git/mingw64/bin/git-credential-manager.exe"
fi