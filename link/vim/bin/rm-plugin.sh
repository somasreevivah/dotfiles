#!/bin/sh

VIMRC="$HOME/.vimrc"
plugin_name=$1


if test -z $plugin_name
then
  echo "usage: $0 <plugin-name>"
  exit 1
fi

plugin_folder="$HOME/.vim/bundle/$plugin_name"
if test -d $plugin_folder
then
  echo "Removing folder $plugin_folder"
  rm -rf $plugin_folder || exit 1
else
  echo -e "\033[1;93m Folder $plugin_folder not found, maybe you have the plugin somewhere else \033[0m"
fi

echo -e "removing plugin from $vimrc"
sed "/$plug_name/d" $VIMRC || exit 1

