#!/bin/bash

cd "$(dirname "$0")"
DOTFILES_ROOT=$(pwd -P)

set -e

# shellcheck source=helper_funcs/logging.sh
source "$DOTFILES_ROOT/helper_funcs/logging.sh"

SKIP_ALL=S
SKIP_ONE=s
BACKUP_ALL=B
BACKUP_ONE=b
OVERWRITE_ALL=O
OVERWRITE_ONE=o
auto_action=

function link_one() {
  local src=$1 dst=$2
  local dst_short=${dst/#$HOME/\~}
  local action= dolink= file_already_logged=

  if [[ "$src" -ef "$dst" ]]; then
    log_info "\e[96m${dst_short}\e[0m: already linked, skipping"
    return
  fi

  if [[ -f "$dst" || -d "$dst" || -L "$dst" ]]; then
    log_info "\e[96m$dst_short\e[0m: conflict"
    file_already_logged=true

    if [[ "$auto_action" != "" ]]; then
      action=$auto_action
    else
      log_q "  Choose: [s]kip,     [o]verwrite,     [b]ackup"
      log_q "          [S]kip all, [O]verwrite all, [B]ackup all"
      read -n 1 -p '? ' action
    fi

    local action_name=
    case "$action" in
      $OVERWRITE_ALL)
        action_name="overwrite all"
        auto_action=$action;;
      $BACKUP_ALL)
        action_name="backup all"
        auto_action=$action;;
      $SKIP_ALL)
        action_name="skip all"
        auto_action=$action;;
      $OVERWRITE_ONE)
        action_name="overwrite";;
      $BACKUP_ONE)
        action_name="backup";;
      $SKIP_ONE)
        action_name="skip";;
      *)
        action_name="unknown action ($action); skipping"
        action=$SKIP_ONE;;
    esac

    log_info "  You chose: \e[33m$action_name\e[0m"

    case "$action" in
      $OVERWRITE_ALL|$OVERWRITE_ONE)
        rm -rf "$dst"
        log_ok "  removed"
        dolink=true
        ;;
      $BACKUP_ALL|$BACKUP_ONE)
        mv "$dst" "${dst}.backup"
        log_ok "  backup complete"
        dolink=true
        ;;
      $SKIP_ALL|$SKIP_ONE)
        log_info "  skipped"
        dolink=false
        ;;
    esac
  else # no coflict
    dolink=true
  fi

  if [[ "$dolink" == "true" ]]; then
    mkdir -p "$(dirname "$dst")"
    ln -s "$src" "$dst"
    if [[ "$file_already_logged" == "true" ]]; then
      log_ok "  linked"
    else
      log_ok "\e[96m$dst_short\e[0m: linked"
    fi
  fi
}

function link_all() {
  log_info "installing all dotfiles"
  for module_dir in $(find -H "$DOTFILES_ROOT/modules" -type d -maxdepth 1 -not -path '*.git*' | grep -v "^$DOTFILES_ROOT/modules\$"); do
    echo "$module_dir"
    for src in $(find -H "$module_dir" -name '*.symlink' -not -path '*.git*'); do
      src_rel="${src##$module_dir/}"
      dst="$HOME/.${src_rel%.*}"
      link_one "$src" "$dst"
    done
  done
}

function install_homebrew() {
  if command -v brew >/dev/null; then
    log_info "Homebrew already installed"
    return
  fi
  log_info "Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  log_ok "Homebrew installed successfully"
}

function install_homebrew_apps() {
  log_info "Installing Homebrew apps..."
  brew bundle install --global
  log_info "Running brew cleanup"
  brew cleanup
}

function run_installers() {
  log_info "Locating installers..."
  for installer in $(find -H "$DOTFILES_ROOT/modules" -name 'install.sh' -not -path '*.git*'); do
    log_info "  found: ${installer#$DOTFILES_ROOT/modules/}"
    sh -c "${installer}"
  done
}

echo ''

link_all
exit 0
install_homebrew
install_homebrew_apps
run_installers

echo ''
