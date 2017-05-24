#! /usr/bin/env bash

dir="$1"

if [[ -z ${dir} ]]; then
  dir=${PWD}
fi

for i in ${dir}/*; do
  echo "$i"
  mv "$i" $(sed "s/ /_/g" <<<"$i")
done
