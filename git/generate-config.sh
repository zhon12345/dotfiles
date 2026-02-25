#!/bin/bash

[[ -f "${HOME}/.profile" ]] && \. ~/.profile

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

if [[ ! -d "${XDG_CONFIG_HOME}/git" ]]; then
	mkdir -p "${XDG_CONFIG_HOME}/git"
fi

declare -A git_config=(
	["core.autocrlf"]="input"
	["status.showStash"]="true"
	["init.defaultBranch"]="main"
	["user.name"]="zhon12345"
	["user.email"]="43035773+zhon12345@users.noreply.github.com"
)

if command -v code > /dev/null 2>&1; then
	git_config+=(
		["core.editor"]="code --wait"
	)
fi

if [[ -d "${HOME}/.ssh" ]]; then
	git_config+=(
		["commit.gpgsign"]="true"
		["gpg.format"]="ssh"
		["user.signingkey"]="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIApbUnuwCYVKebGrGJbexsjWOOc4XFRdQLqUZwUz9a8Q"
		["gpg.ssh.allowedSignersFile"]="$HOME/.ssh/allowedSignersFile"
	)

	if [[ "$MACHINE" = "Windows" ]]; then
		git_config+=(
			["core.sshCommand"]="C:/Windows/System32/OpenSSH/ssh.exe"
			["gpg.ssh.program"]="C:/Windows/System32/OpenSSH/ssh-keygen.exe"
		)
	fi

	if [[ "$(uname -a)" =~ "WSL" ]]; then
		git_config+=(
			["core.sshCommand"]="/mnt/c/Windows/System32/OpenSSH/ssh.exe"
			["gpg.ssh.program"]="/mnt/c/Windows/System32/OpenSSH/ssh-keygen.exe"
			["credential.helper"]="/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"
		)
	fi
fi

export GIT_CONFIG_GLOBAL="${XDG_CONFIG_HOME}/git/config"

if [[ -f "${GIT_CONFIG_GLOBAL}" ]]; then
	rm -f "${GIT_CONFIG_GLOBAL}"
fi

for key in "${!git_config[@]}"; do
	git config --global "${key}" "${git_config[${key}]}"
done