path=(
  "${HOME}"/bin
  "${HOME}"/.local/bin
  "${DOTFILES_HOME}"/bin
  "${HOME}"/go/bin
  "${HOME}"/dev/go/bin
  "$("${HOMEBREW_PREFIX}"/bin/brew --prefix openjdk)"/bin
  "$("${HOMEBREW_PREFIX}"/bin/brew --prefix openssh)"/bin
  "$("${HOMEBREW_PREFIX}"/bin/brew --prefix coreutils)"/libexec/gnubin
  "$("${HOMEBREW_PREFIX}"/bin/brew --prefix openssl)"/bin
  '/usr/local/bin'
  $path
)
