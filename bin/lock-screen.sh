#! /usr/bin/env bash


color=$(
  for i in {1..6}; do
    { for j in {1..9} {a..e}; do echo $j; done } |
    shuf |
    sed -n 1p |
    tr -d "\n"
  done
)

i3lock -c ${color} -b -p win

#vim-run: bash %
