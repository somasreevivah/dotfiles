#! /usr/bin/env bash

rotation_file=~/.cache/rotate-screen

get_primary_screen() {
  xrandr | grep 'connected primary' | cut -f1 -d ' '
}

is_rotated() {
  mkdir -p $(dirname ${rotation_file})
  if grep left ${rotation_file}; then
    return 0
  else
    return 1
  fi
}

primary=$(get_primary_screen)

echo "${primary}"

if is_rotated; then
  cmd="xrandr --output ${primary} --rotate normal"
  ${cmd}
  echo "${cmd}" > ${rotation_file}
else
  cmd="xrandr --output ${primary} --rotate left"
  ${cmd}
  echo "${cmd}" > ${rotation_file}
fi
