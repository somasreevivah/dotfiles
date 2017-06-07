#! /usr/bin/env bash



# In general do this
if which rofi >&1 2> /dev/null; then
  rofi -show Window
  exit $?
fi

