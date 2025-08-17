#!/bin/bash

. ~/.profile

if [[ ! -d "${XDG_CONFIG_HOME}/git" ]]; then
	mkdir -p "${XDG_CONFIG_HOME}/git"
fi

declare -A git_config=(
	["commit.gpgsign"]="true"
	["core.autocrlf"]="input"
	["status.showStash"]="true"
	["init.defaultBranch"]="main"
	["gpg.format"]="ssh"
	["user.name"]="zhon12345"
	["user.email"]="43035773+zhon12345@users.noreply.github.com"
	["user.signingkey"]="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIApbUnuwCYVKebGrGJbexsjWOOc4XFRdQLqUZwUz9a8Q"
	["url."https://github.com/".insteadOf"]="gh:"
	["url."https://github.com/zhon12345/".insteadOf"]="zhon:"
)

export GIT_CONFIG_GLOBAL="${XDG_CONFIG_HOME}/git/config"

if [[ -f "${GIT_CONFIG_GLOBAL}" ]]; then
	rm -f "${GIT_CONFIG_GLOBAL}"
fi

for key in "${!git_config[@]}"; do
	git config --global "${key}" "${git_config[${key}]}"
done

if [[ "$MACHINE" = "Windows" ]]; then
	git config --global core.sshCommand "C:/Windows/System32/OpenSSH/ssh.exe"
	git config --global gpg.ssh.program "C:/Windows/System32/OpenSSH/ssh-keygen.exe"
fi

if command -v code > /dev/null 2>&1; then
	git config --global core.editor "code --wait"
fi

if [[ "$(uname -a)" =~ "WSL" ]]; then
	git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"
fi