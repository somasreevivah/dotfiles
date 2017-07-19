#! /usr/bin/env bash

url=$1

rss_url=$(
  curl -s ${1}  |
  grep channel_id |
  sed "s/^.*\(https:\/\/.*youtube.*channel_id[^ \"]\+\).*$/\1/"
)

if [[ -z ${rss_url} ]]; then
  echo "Rss url not found ... :("
  exit 1
fi

echo ${rss_url}

#vim-run: bash % https://www.youtube.com/user/Techquickie
