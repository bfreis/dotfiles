export ANDROID_HOME="$HOME"/Library/Android/sdk


if [ ! -d "$ANDROID_HOME" ]; then
  return
fi



if [ ! -d "$ANDROID_HOME"/ndk ]; then
  return
fi

export ANDROID_NDK_HOME=${ANDROID_HOME}/ndk/$(find "${ANDROID_HOME}"/ndk -type d -mindepth 1 -maxdepth 1 -execdir printf '%s\n' {} + | sort -n -r | head -n 1)

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
