#! /usr/bin/env bash

qutebrowser --target window \
  ":open $(echo -n | dmenu-style.sh -p Search)"
