# configure fpath to allow autload for any functions in funcs folder in modules
fpath=($ZSH/modules/**/funcs "${fpath[@]}")

# prepare all funcs for autoloading
for fnfile in $ZSH/modules/**/funcs/*(:t); do
  autoload -Uz $fnfile
done
