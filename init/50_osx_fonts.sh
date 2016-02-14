# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Copy fonts
{
  pushd $DOTFILES/conf/osx/fonts/; setdiffA=(*); popd
  pushd ~/Library/Fonts/; setdiffB=(*); popd
  setdiff
} >/dev/null

if (( ${#setdiffC[@]} > 0 )); then
  dfs::header "Copying fonts (${#setdiffC[@]})"
  for f in "${setdiffC[@]}"; do
    dfs::arrow "$f"
    cp "$DOTFILES/conf/osx/fonts/$f" ~/Library/Fonts/
  done
fi
