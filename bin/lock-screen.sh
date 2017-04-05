#! /usr/bin/env bash


color=$(
  for i in {1..6}; do
    { for j in {0..9} {a..f}; do echo $j; done } |
    shuf |
    sed -n 1p |
    tr -d "\n"
  done
)

i3lock -c ${color}

#vim-run: bash %
