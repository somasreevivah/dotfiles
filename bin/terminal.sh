#! /usr/bin/env bash

{
if which urxvt; then
  # Because it works well with ranger for images
  urxvt $([[ -f ~/.flags/urxvt ]] && cat ~/.flags/urxvt) $*
elif which lilyterm; then
  lilyterm $*
elif which konsole; then
  konsole $*
else
  xterm $*
fi
} || xdg-terminal
