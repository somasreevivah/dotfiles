#! /usr/bin/env bash

set -eu

PY=$1
$1 <(curl https://bootstrap.pypa.io/get-pip.py)
