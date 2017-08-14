#! /usr/bin/env bash



# In general do this
if which rofi >&1 2> /dev/null; then
  if [[ $(hostname) == cqc02 ]]; then
    rofi -show run
  else
    rofi -show combi
  fi
  exit $?
elif which dmenu_run >&1 2> /dev/null; then
  dmenu_run -i -l 10
  exit $?
fi

