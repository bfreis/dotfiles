## configure all coreutils aliases
#if (( $+commands[brew] )); then
#  bindir=$(brew --prefix)/opt/coreutils/bin
#  if [[ -d $bindir ]]; then
#    for binary in $bindir/g*(*); do
#      alias_name=${binary#$bindir/g}
#      alias $alias_name=$binary
#    done
#  fi
#fi
#
## configure all findutils aliases
#if (( $+commands[brew] )); then
#  bindir=$(brew --prefix)/opt/findutils/bin
#  if [[ -d $bindir ]]; then
#    for binary in $bindir/g*(*); do
#      alias_name=${binary#$bindir/g}
#      alias $alias_name=$binary
#    done
#  fi
#fi
#
#if (( $+commands[gls] )); then
#  alias l="ls -lAh --color"
#  alias ll="ls -lAhF --color"
#  alias la='ls -A --color'
#fi
alias l="ls -lAhF --color"
alias ll="ls -lAhF --color"
alias la='ls -A --color'

alias p="ping -i 0.1 1.1.1.1"

# GRC - Generic Couloriser
# (must load after other aliases to proper colorize GNU coreutils and ...)
if (( $+commands[grc] )) && (( $+commands[brew] )); then
  source $(brew --prefix)/etc/grc.zsh
fi
