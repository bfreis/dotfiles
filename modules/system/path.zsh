typeset -U path

path=('/usr/local/bin' $path)

path=(
  $HOME/bin
  $ZSH/bin
  $HOME/go/bin
  $(brew --prefix)/opt/coreutils/libexec/gnubin
  $(brew --prefix)/opt/openssl/bin
  $path
)

export PATH
