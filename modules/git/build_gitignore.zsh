cat \
  <(echo "# THIS FILE IS GENERATED AUTOMATICALLY. CHANGES WILL BE LOST.") \
  <(echo "# See: dotfiles/modules/git/build_gitignore.zsh\n") \
  <(echo "### START ~/.gitignore_global ###") \
  ~/.gitignore_global \
  <(echo "### END ~/.gitignore_global ###") \
  <(echo "### START ~/.gitignore_local ###") \
  ~/.gitignore_local \
  <(echo "### END ~/.gitignore_local ###") \
  > ~/.gitignore \
  2>/dev/null
