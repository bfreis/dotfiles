alias l="ls -lAhF --color"
alias ll="ls -lAhF --color"
alias la='ls -A --color'

alias p="ping -i 0.1 1.1.1.1"

# GRC - Generic Couloriser
# (must load after other aliases to proper colorize GNU coreutils and ...)
if (( $+commands[grc] )) && (( $+commands[brew] )); then
  source $(brew --prefix)/etc/grc.zsh
fi
