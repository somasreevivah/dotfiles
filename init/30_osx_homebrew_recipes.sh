# OSX-only stuff. Abort if not OSX.
dfs_is_osx || return 1

# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && dfs_error "Brew recipes need Homebrew to install." && return 1

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

