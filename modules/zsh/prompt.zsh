setopt PROMPT_SUBST
autoload colors && colors

function directory_name() {
  echo "%F{117}%~%F{reset_color}"
}

export PROMPT=$'$(directory_name) %F{077}ᐅ%F{reset} '
