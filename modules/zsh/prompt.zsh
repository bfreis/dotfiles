setopt PROMPT_SUBST
autoload colors && colors

function directory_name() {
  echo "%F{117}%~%F{reset_color}"
}

export GIT_PROMPT_INDENT_HACK=0
export PROMPT=$'%F{105}%m%F{reset_color}:$(directory_name) %F{077}ᐅ%F{reset} '
