# dotfiles

## Configuration load order

- ~/.localrc
- modules/**/path.zsh
- modules/**/*.zsh (except path.zsh and completion.zsh)
- modules/**/completion.zsh
- ~/.localrc.end

The files `.localrc` and `.localrc.end` allow local pre- and post-initialization
configuration to be loaded. Those files are not committed to version control.

Autoload funcs are loaded from `modules/**/func/*`.
