#!/bin/bash

for file in $@ ; do
  REPO_FILE=$HOME/.vim/etc/$file
  CONF_FILE=$HOME/.$file
  if ! test -e $REPO_FILE; then 
    echo "ERROR: $REPO_FILE not found";
    exit 1;
  fi
  if test -e $CONF_FILE; then
    echo "Warning: there is a .$file file in your home directory, it will be erased, are you sure you want to continue?"
    read -p "(y/n):  " CONTINUE
    if test $CONTINUE = y; then
      rm $CONF_FILE
    else
      echo "Safely exiting..."
      exit 1
    fi
  fi
  echo -e "\033[0;106mLinking\033[0m $CONF_FILE to $REPO_FILE\n"
  ln -s $REPO_FILE $CONF_FILE
done


