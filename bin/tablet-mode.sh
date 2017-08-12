#! /usr/bin/env bash

main_actions=(
fullscreen
go_to_sleep
go_to_sleep_and_lock
)

convert_to_rofi_options() {
  local options=( $@ )
  local result
  for option in ${options[@]} ; do
    result="${option}|${result}"
  done
  echo ${result}
}

choose_from_actions() {
  local actions=( $@ )
  options=$(convert_to_rofi_options ${actions[@]})
  echo -e "${options}" |
  rofi \
    -location 6\
    -dmenu\
    -p Select action\
    -eh 2\
    -sep \|\
    -case-sensitive\
    -select
}

fullscreen() {
  i3-msg fullscreen
}

go_to_sleep_and_lock(){
  systemctl hybrid-sleep; ~/.dotfiles/bin/lock-screen.sh
}

go_to_sleep(){
  systemctl hybrid-sleep
}

action=$(choose_from_actions ${main_actions[@]})
${action}
