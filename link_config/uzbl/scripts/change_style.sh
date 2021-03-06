#/bin/bash

# Author: Jurica Bradaric <jbradaric at gmail.com> 
# A simple script to use custom stylesheets for websites.
# Similar to the Stylish extension for Firefox.
# I hope someone finds it useful. All comments and suggestions
# are welcome.


XDG_DATA_HOME=$HOME/.config

# Set the path to the .css files
# Every custom css style must be in a file named web_address.css
# e.g. reddit.com.css
STYLE_PATH=$XDG_DATA_HOME/uzbl/userstyles

STYLESHEET_SET=0

for i in $STYLE_PATH/*.css; do
  stylesheet=$(basename $i '.css')
  #echo $i
  #echo "export stylesheet=$stylesheet"
  #echo "export UZBL_URI=$UZBL_URI"
  #if [[ "$UZBL_URI" =~ "$stylesheet" ]]; then
  if echo $UZBL_URI | grep -E "$stylesheet" ; then
    #echo " \033[0;105mI AM HERE  $UZBL_URI  $i\033[0m"
    echo "set stylesheet_uri = file://${STYLE_PATH}/${stylesheet}.css" > "$UZBL_FIFO"
    STYLESHEET_SET=1
    break
  fi
done

if [ $STYLESHEET_SET -eq 0 ]; then
  echo "set stylesheet_uri = file://${STYLE_PATH}/default.css" > "$UZBL_FIFO"
fi

exit 0
