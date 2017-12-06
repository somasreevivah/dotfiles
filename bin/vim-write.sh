#! /usr/bin/env bash

tmp_file=$(mktemp --suffix=vim-write)

notify-send vim

gvim -f ${tmp_file}
xdotool type --file ${tmp_file}
