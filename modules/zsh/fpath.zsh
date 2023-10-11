if (( $+commands[task] )) && (( $+commands[brew] )); then
  fpath=(
    "$(brew --prefix go-task)"/share/zsh/site-functions
    "${fpath[@]}"
  )
fi

# configure fpath to allow autoload for any functions in funcs folder in modules
fpath=("${DOTFILES_HOME}"/modules/**/funcs "${fpath[@]}")

# prepare all funcs for autoloading
for fnfile in "${DOTFILES_HOME}"/modules/**/funcs/*(:t); do
  autoload -Uz "${fnfile}"
done
