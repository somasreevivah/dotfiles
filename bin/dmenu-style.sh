#! /usr/bin/env bash

cat - |
dmenu \
-b \
-i \
-l "10" \
-fn "monospace-14" \
-nb "#000000" \
-nf "#55ff55" \
-sb "#005500" \
-sf "#f0f0f0" \
$@


