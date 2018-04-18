#! /usr/bin/env bash
# Author: Alejandro Gallo.
# License: 2018, GPLv3.
# Email: aamsgallo@gmail.com

device_path=/sys/class/backlight/acpi_video0/
device_path_actual_brightness=${device_path}/actual_brightness
device_path_max_brightness=${device_path}/max_brightness
device_path_brightness=${device_path}/brightness

for path in ${device_path} \
  ${device_path_actual_brightness} \
  ${device_path_max_brightness} \
  ${device_path_brightness} \
; do

  [[ -e ${path} ]] || {
    echo "${path} does not exist..."
    exit 1
  }

done

cmd=$1
level=$2

if [[ ${cmd} = '-h' || -z ${cmd} ]]; then
  cat <<EOF
Usage: $(basename $0) command level

command
-------
get
getmax
decrease
increase
EOF
  exit 0
fi

get() {
  cat ${device_path_actual_brightness}
}

getmax() {
  cat ${device_path_max_brightness}
}

decrease() {
  level=$1
  new_level=$(($(get)-$1))
  echo Decreasing to ${new_level}
  echo ${new_level} | sudo tee ${device_path_brightness}
}

increase() {
  level=$1
  new_level=$(($(get)+$1))
  echo Increasing to ${new_level}
  echo ${new_level} | sudo tee ${device_path_brightness}
}

$cmd $level
