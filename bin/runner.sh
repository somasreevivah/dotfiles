#! /usr/bin/env bash



# In general do this
if type -a rofi; then
  rofi -show run
  exit $?
elif type -a dmenu; then
  dmenu_run
  exit $?
fi

