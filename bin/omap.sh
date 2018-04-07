#! /usr/bin/env bash

set -x
qutebrowser \
"https://www.openstreetmap.org/search?query=$(echo $@ | tr ' ' '+') "
set +x
