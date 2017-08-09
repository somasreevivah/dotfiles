#! /usr/bin/env bash

d_file=${HOME}/.cache/i3-desktop-file
mkdir -p $(dirname ${d_file})

if [[ -f ${d_file} ]]; then
  rm ${d_file}
  i3-msg workspace back_and_forth
else
  touch ${d_file}
  i3-msg workspace Desktop
fi
