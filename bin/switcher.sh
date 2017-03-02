#! /usr/bin/env bash



# In general do this
if type -a rofi; then
  rofi -show Window
  exit $?
fi

