# configure fpath to allow autload for any functions in funcs folder in modules
fpath=($DOTFILES_HOME/modules/**/funcs "${fpath[@]}")

# prepare all funcs for autoloading
for fnfile in $DOTFILES_HOME/modules/**/funcs/*(:t); do
  autoload -Uz $fnfile
done
