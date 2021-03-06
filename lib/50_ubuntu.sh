dfs_log sourcing 50_ubuntu.sh
# Ubuntu-only stuff. Abort if not Ubuntu.
dfs_is_ubuntu || return 1


# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Switch between already-downloaded node versions.
node_ver() {
  (
    ver="${1#v}"
    nodes=()
    if [[ ! -e "/usr/local/src/node-v$ver" ]]; then
      shopt -s extglob
      shopt -s nullglob
      cd "/usr/local/src"
      eval 'for n in node-v*+([0-9]).+([0-9]).+([0-9]); do nodes=("${nodes[@]}" "${n#node-}"); done'
      [[ "$1" ]] && echo "Node.js version \"$1\" not found."
      echo "Valid versions are: ${nodes[*]}"
      [[ "$(type -P node)" ]] && echo "Current version is: $(node --version)"
      exit 1
    fi
    cd "/usr/local/src/node-v$ver"
    sudo make install >/dev/null 2>&1 &&
    echo "Node.js $(node --version) installed." ||
    echo "Error, $(node --version) installed."
  )
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
