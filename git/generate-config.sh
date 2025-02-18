#!/bin/bash

declare -A git_config=(
	["user.name"]="zhon12345"
	["user.email"]="43035773+zhon12345@users.noreply.github.com"
	["core.editor"]="code --wait"
	["core.autocrlf"]="input"
	["init.defaultBranch"]="main"
)

for key in "${!git_config[@]}"; do
	git config --global "${key}" "${git_config[${key}]}"
done

if [[ "$(uname -a)" =~ "WSL" ]]; then
	git config --global credential.helper "/mnt/c/Program\\ Files/Git/mingw64/bin/git-credential-manager.exe"
fi