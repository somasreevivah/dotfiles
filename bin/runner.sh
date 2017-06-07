#! /usr/bin/env bash



# In general do this
if which rofi >&1 2> /dev/null; then
  rofi -show run
  exit $?
elif which dmenu_run >&1 2> /dev/null; then
  dmenu_run -i -l 10
  exit $?
fi

