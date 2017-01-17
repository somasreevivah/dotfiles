#! /usr/bin/env bash

if [[ $( hostname ) = pccq05 ]]; then
  echo "Using xcompmgr as composite manager"
  xcompmgr -c -f -n
fi
