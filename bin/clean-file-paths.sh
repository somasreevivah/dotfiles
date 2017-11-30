#! /usr/bin/env bash

if [[ $1 = -h ]]; then
  echo "Usage: $0 folder-to-clean-files"
  exit 0
fi

folder="$1"

for file_type in d f; do

  find "${folder}" -type ${file_type} | while read path; do
    echo "Processing ${path}"
    new_path=$(echo "${path}" | sed "s/ \+/_/g")
    if [[ ! "${path}" = ${new_path} ]]; then
      echo "  to ${new_path}"
    fi
  done

done
