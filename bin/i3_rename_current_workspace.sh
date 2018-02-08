#! /usr/bin/env bash

get_current_workspace() {
  i3-msg -t get_workspaces        |
  tr "{" "\n"                     |
  grep name.*focused..true        |
  sed "s/.*name\":\"//; s/\".*//"
}



new_name=$(
  dmenu \
    -p 'New name' \
    -fn fixed-14 \
    -nb \#000000 \
    -nf \#55ff55 \
    -sb \#005500 \
    -sf \#f0f0f0 \
    -b \
)

cmd="rename workspace \"$(get_current_workspace)\" to ${new_name}"
echo "${cmd}"
i3-msg "${cmd}"
