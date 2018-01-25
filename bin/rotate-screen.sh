#! /usr/bin/env bash

#left
#xsetwacom  --set "Wacom ISDv4 E6 Finger touch" rotate ccw
#right
#xsetwacom  --set "Wacom ISDv4 E6 Finger touch" rotate ccw

rotation_file=~/.cache/rotate-screen

mode=${1}

get_primary_screen() {
  xrandr | grep 'connected primary' | cut -f1 -d ' '
}

is_rotated() {
  mkdir -p $(dirname ${rotation_file})
  if grep normal ${rotation_file}; then
    return 1
  else
    return 0
  fi
}

primary=$(get_primary_screen)

echo "${primary}"

if is_rotated; then
  cmd="xrandr --output ${primary} --rotate normal"
  ${cmd}
  echo "${cmd}" > ${rotation_file}
else
  cmd="xrandr --output ${primary} --rotate ${mode}"
  ${cmd}
  echo "${cmd}" > ${rotation_file}
fi
