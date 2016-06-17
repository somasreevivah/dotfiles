# OSX-only stuff. Abort if not OSX.
dfs_is_osx || return 0

if [[ $(whoami) =~ st* ]]; then
  export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications --caskroom=$HOME/local/Caskroom"
fi
