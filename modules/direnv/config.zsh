
# shellcheck disable=SC2154
if (( $+commands[direnv] )); then
  eval "$(direnv hook zsh)"
fi
