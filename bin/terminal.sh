#! /usr/bin/env bash


if which lilyterm; then
  lilyterm $*
elif which konsole; then
  konsole $*
else
  xterm $*
fi
