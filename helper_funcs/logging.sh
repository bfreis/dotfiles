function log_gen() {
  local code="$1"
  shift
  local msg="$*"
  printf "\r\e[2K\e[0m [$code] $msg\n"
}

function log_info() {
  log_gen " \e[36m..\e[0m " "$*"
}

function log_ok() {
  log_gen " \e[32mok\e[0m " "$*"
}

function log_q() {
  log_gen " \e[33m??\e[0m " "$*"
}

function log_fail() {
  log_gen "\e[31mFAIL\e[0m" "$*"
  echo ''
  exit 1
}
