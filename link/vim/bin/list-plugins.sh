#!/bin/bash

SCRIPT_DIR=$(dirname $0) 

echo -e "====> \033[4;31mList plugins in the vimrc file\033[0m"
grep "Plugin " "$SCRIPT_DIR/../etc/vimrc"  | sed -e "s+[a-z]*[0-9]*/++" -e "s/Plugin//" | tr -d "'" | tr -d " "
