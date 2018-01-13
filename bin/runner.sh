#! /usr/bin/env bash

~/.dotfiles/bin/i3-window-jumper.py &&
exit 0 ||
dmenu_run &&
exit 0


# In general do this
if which rofi >&1 2> /dev/null; then
  if [[ $(hostname) == cqc02 ]]; then
    rofi -show run
  else
    rofi -show combi
  fi
  exit $?
elif which dmenu_run >&1 2> /dev/null; then
  dmenu_run \
    -b \
    -i \
    -fn fixed-14 \
    -nb \#000000 \
    -nf \#55ff55 \
    -sb \#c0c0c0 \
    -sf \#000000 \
    -l 10
  exit $?
fi

