#! /usr/bin/env bash

rotation_file=~/.cache/rotate-screen

#normal left right inverted
mode=${1}

wacom_rotate() {
  type -a xsetwacom || return
  local mode=$1
  if [[ ${mode} = normal ]]; then
    mode=none
  elif [[ ${mode} = left ]]; then
    mode=ccw
  elif [[ ${mode} = right ]]; then
    mode=cw
  elif [[ ${mode} = inverted ]]; then
    mode=half
  fi
  xsetwacom  --set "Wacom ISDv4 E6 Finger touch" rotate ${mode}
}

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
  mode="normal"
fi

cmd="xrandr --output ${primary} --rotate ${mode}"
${cmd}
wacom_rotate $mode
echo "${cmd}" > ${rotation_file}
