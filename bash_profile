if command -v zsh &> /dev/null; then
  exec zsh
else
  test -f ~/.profile && . ~/.profile
  test -f ~/.bashrc && . ~/.bashrc
fi
