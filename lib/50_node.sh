dfs_log sourcing 50_node.sh
######################################
#  I DO NOT KNOW YET WHAT THIS DOES  #
######################################


# set up local npm path
export PATH=$PATH:$HOME/node_modules/.bin/



return 0



# Global npm modules to install.
npm_globals=(
  bower
)

# Update npm and install global modules.
npm_install() {
  local installed modules
  dfs_header "Updating npm"
  npm update -g npm
  { pushd "$(npm config get prefix)/lib/node_modules"; installed=(*); popd; } >/dev/null
  modules=($(setdiff "${npm_globals[*]}" "${installed[*]}"))
  if (( ${#modules[@]} > 0 )); then
    dfs_header "Installing Npm modules: ${modules[*]}"
    npm install -g "${modules[@]}"
  fi
}

# Publish module to Npm registry, but don't update "latest" unless the version
# is an actual release version!
npm_publish() {
  local version="$(node -pe 'require("./package.json").version' 2>/dev/null)"
  if [[ "${version#v}" =~ [a-z] ]]; then
    local branch="$(git branch | perl -ne '/^\* (.*)/ && print $1')"
    echo "Publishing dev version $version with --force --tag=$branch"
    npm publish --force --tag="$branch" "$@"
  else
    echo "Publishing new latest version $version"
    npm publish "$@"
  fi
}



# Look at a project's package.json and figure out what dependencies can be
# updated. While the "npm outdated" command only lists versions that are valid
# per the version string in package.json, this looks at the @latest tag in npm.

npm_latest() {
  if [[ -e 'node_modules' ]]; then
    echo 'Backing up node_modules directory.'
    mv "node_modules" "node_modules-$(date "+%Y_%m_%d-%H_%M_%S")"
  fi
  local deps='JSON.parse(require("fs").readFileSync("package.json")).dependencies'
  # Install the latest version of all dependencies listed in package.json.
  echo 'Installing @latest version of all dependencies...'
  npm install $(node -pe "Object.keys($deps).map(function(m){return m+'@latest'}).join(' ')");
  # List all dependencies that are now invalid, along with their (new) version.
  local npm_ls="$(npm ls 2>/dev/null)"
  if echo "$npm_ls" | grep invalid >/dev/null; then
    echo -e '\nTHESE DEPENDENCIES CAN POSSIBLY BE UPDATED\n'
    echo 'Module name:                   @latest:             package.json:'
    echo "$npm_ls" | perl -ne "m/.{10}(.+)@(.+?) invalid\$/ && printf \"%-30s %-20s %s\", \$1, \$2, \`node -pe '$deps[\"\$1\"]'\`"
    return 99
  else
    echo -e '\nAll dependencies are @latest version.'
  fi
}

