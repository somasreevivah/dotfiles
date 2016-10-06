# OSX-only stuff. Abort if not OSX.
dfs_is_osx || return 1

# Install Homebrew.
if [[ ! "$(type -P brew)" ]]; then
  dfs_header "Installing Homebrew"
  true | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Exit if, for some reason, Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Homebrew failed to install." && return 1

dfs_header "Updating Homebrew"
brew doctor
brew update

# Functions used in subsequent init scripts.

# Tap Homebrew kegs.
brew_tap_kegs() {
  kegs=($(setdiff "${kegs[*]}" "$(brew tap)"))
  if (( ${#kegs[@]} > 0 )); then
    dfs_header "Tapping Homebrew kegs: ${kegs[*]}"
    for keg in "${kegs[@]}"; do
      brew tap $keg
    done
  fi
}

# Install Homebrew recipes.
brew_install_recipes() {
  recipes=($(setdiff "${recipes[*]}" "$(brew list)"))
  if (( ${#recipes[@]} > 0 )); then
    dfs_header "Installing Homebrew recipes: ${recipes[*]}"
    for recipe in "${recipes[@]}"; do
      brew install $recipe
    done
  fi
}

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
