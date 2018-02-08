#! /usr/bin/env bash

get_current_workspace() {
  i3-msg -t get_workspaces        |
  tr "{" "\n"                     |
  grep name.*focused..true        |
  sed "s/.*name\":\"//; s/\".*//"
}

i3-input -l 1 -F 'rename '$(get_current_workspace)' to %s' -P 'Rename: '
