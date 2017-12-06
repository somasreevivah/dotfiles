#! /usr/bin/env bash

tmp_file=$(mktemp --suffix=vim-write)

#xdotool type --file ${tmp_file} &&
#current_id=$(xdotool getActiveWindow)

gvim -f ${tmp_file} &&
xclip -i ${tmp_file} &&
xdotool key Shift+Insert

