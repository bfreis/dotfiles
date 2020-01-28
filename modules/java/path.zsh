typeset -U path

path=(
  $(/usr/libexec/java_home)/bin
  $path
)

export PATH
