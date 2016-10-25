dfs_is_osx && return 1


# Install APT packages.
packages=(
  git
  htop
  tree
  dzen2
  mupdf
  mutt
  vim-nox
  nasm
  antiword
)


install_debian_packages() {
  # Update APT.
  dfs_header "Updating APT"
  #sudo apt-get -qq update
  sudo apt-get update
  #sudo apt-get -qq dist-upgrade

  packages=($(setdiff "${packages[*]}" "$(dpkg --get-selections | grep -v deinstall | awk '{print $1}')"))

  if (( ${#packages[@]} > 0 )); then
    dfs_header "Installing APT packages: ${packages[*]}"
    for package in "${packages[@]}"; do
      sudo apt-get -qq install "$package"
    done
  fi

}

if dfs_is_debian || dfs_is_ubuntu; then
  install_debian_packages
fi
