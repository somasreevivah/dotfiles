dfs_is_osx && return 1


packages=(
  git
  vim
  sudo
  rfkill
  espeak
  htop
  xclip
  feh
  info
  tree
  w3m
  w3m-img
  elinks
  fortune
  cowsay
  zathura
  zathura-djvu
  mupdf
  automake
  tig
  gcc
  mutt
  nasm
  mplayer
)

debian_packages=(
  aptitude
  rofi
  python3-pip
  autotools-dev
)


install_debian_packages() {
  dfs_header "Updating APT"
  sudo apt-get update

  packages=($(setdiff "${packages[*]}" "$(dpkg --get-selections | grep -v deinstall | awk '{print $1}')"))

  if (( ${#packages[@]} > 0 )); then
    dfs_header "Installing APT packages: ${packages[*]}"
    for package in "${packages[@]}"; do
      sudo apt-get -qq install "$package"
    done
  fi
}

install_linux_packages(){
  packs=$@
  for p in ${packs[@]}; do
    sudo apt-get install ${p}
  done
}


install_linux_packages ${packages[@]}

if dfs_is_debian || dfs_is_ubuntu; then
  install_linux_packages ${debian_packages[@]}
fi
