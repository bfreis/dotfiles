typeset -U path

export ANDROID_HOME="$HOME"/Library/Android/sdk

path=(
  "$HOME"/Library/Android/sdk/emulator
  "$HOME"/Library/Android/sdk/tools
  "$HOME"/Library/Android/sdk/tools/bin
  "$HOME"/Library/Android/sdk/platform-tools

  "$HOME"/flutter/bin
  "$HOME"/flutter/.pub-cache/bin
  "$HOME"/.pub-cache/bin
  $path
)

export PATH
