
function install_node_npm_locally() {
  local install_folder="$HOME/.local"
  echo 'export PATH=$HOME/local/bin:$PATH' >> ~/.bashrc
  . ~/.bashrc
  mkdir -p $install_folder
  mkdir ~/node-latest-install
  cd ~/node-latest-install
  curl http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1
  ./configure --prefix=$install_folder
  make install
  curl https://www.npmjs.org/install.sh | sh
  cd -
}

if ! which node > /dev/null 2>&1 ; then 
  dfs::error "Node is not installed..."
  read -p "Do you want to install it? (Y/n): " install_node
  [[ $install_node == [y,Y] ]] || return 1
  dfs::header "Installing node..."
  if sudo -v ; then
    dfs::install node npm
  else
    dfs::error "You are not a sudoer, installing it locally..."
    install_node_npm_locally
  fi
fi

# npm-related functions.
source $DOTFILES/lib/50_node.sh

