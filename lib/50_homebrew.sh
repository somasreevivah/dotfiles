# OSX-only stuff. Abort if not OSX.
dfs_is_osx || return 0

if [ -f $(brew --prefix)/etc/bash_completion.d/brew ]; then
  . $(brew --prefix)/etc/bash_completion.d/brew
fi
