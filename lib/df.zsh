__df::debug() {
  if [[ "${DOTFILES_DEBUG}" == "1" ]]; then
    echo "$@"
  fi
}

__df::init_homebrew() {
  if [[ $(arch) == "arm64" ]]; then
    HOMEBREW_PREFIX="/opt/homebrew"
  else
    HOMEBREW_PREFIX="/usr/local"
  fi
  eval "$("${HOMEBREW_PREFIX}"/bin/brew shellenv)"
}

__df::source_if_exists() {
  local file="$1"
  if [[ -f "${file}" ]]; then
    __df::debug "source ${file}"
    # shellcheck disable=SC1090
    source "${file}"
  else
    __df::debug "source ${file}: no such file"
  fi
}

__df::cleanup_funcs() {
  for fname in ${(ok)functions[(I)__df::*]}; do
    unfunction "${fname}"
  done
}

