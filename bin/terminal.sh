#! /usr/bin/env bash


if [[ $(hostname) =~ pccq ]]; then
  xterm $*
  exit
fi

{
if which urxvt; then
  # Because it works well with ranger for images
  urxvt $*
elif which lilyterm; then
  lilyterm $*
elif which konsole; then
  konsole $*
else
  xterm $*
fi
} || xdg-terminal
