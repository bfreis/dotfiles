typeset -U path

path=('/usr/local/bin' $path)

path=(
  $HOME/bin
  $DOTFILES_HOME/bin
  $HOME/go/bin
  $HOME/dev/go/bin
  /usr/local/opt/openjdk/bin
  $(brew --prefix openssh)/bin
  $(brew --prefix)/opt/coreutils/libexec/gnubin
  $(brew --prefix)/opt/openssl/bin
  $path
)

export PATH
