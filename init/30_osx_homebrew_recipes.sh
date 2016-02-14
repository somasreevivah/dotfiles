# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && dfs::error "Brew recipes need Homebrew to install." && return 1

# Homebrew recipes
recipes=(
  #android-platform-tools
  #ansible
  #bash
  #cmatrix
  #cowsay
  #git
  #git-extras
  #htop-osx
  #hub
  #id3tool
  #lesspipe
  #man2html
  #mercurial
  #nmap
  #sl
  #ssh-copy-id
  #terminal-notifier
  #the_silver_searcher
  #tree
  #wget
)

brew_install_recipes

# Misc cleanup!

# This is where brew stores its binary symlinks
#local binroot="$(brew --config | awk '/HOMEBREW_PREFIX/ {print $2}')"/bin

## htop
#if [[ "$(type -P $binroot/htop)" ]] && [[ "$(stat -L -f "%Su:%Sg" "$binroot/htop")" != "root:wheel" || ! "$(($(stat -L -f "%DMp" "$binroot/htop") & 4))" ]]; then
  #dfs::header "Updating htop permissions"
  #sudo chown root:wheel "$binroot/htop"
  #sudo chmod u+s "$binroot/htop"
#fi

## bash
#if [[ "$(type -P $binroot/bash)" && "$(cat /etc/shells | grep -q "$binroot/bash")" ]]; then
  #dfs::header "Adding $binroot/bash to the list of acceptable shells"
  #echo "$binroot/bash" | sudo tee -a /etc/shells >/dev/null
#fi
#if [[ "$(dscl . -read ~ UserShell | awk '{print $2}')" != "$binroot/bash" ]]; then
  #dfs::header "Making $binroot/bash your default shell"
  #sudo chsh -s "$binroot/bash" "$USER" >/dev/null 2>&1
  #dfs::arrow "Please exit and restart all your shells."
#fi
