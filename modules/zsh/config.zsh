export LSCOLORS="Gxfxcxdxbxegedabagacad"
export CLICOLOR=true

if (( $+commands[vim] )); then
  export EDITOR=vim
else
  export EDITOR=nano
fi

setopt autocd
setopt autopushd
setopt alwaystoend
setopt bsdecho
setopt completeinword
setopt monitor
setopt noflowcontrol
setopt interactivecomments
setopt longlistjobs
setopt pushdignoredups
setopt pushdminus
setopt zle
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

