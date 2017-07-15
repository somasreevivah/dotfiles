#! /usr/bin/env bash

PREFIX=${PREFIX:-${HOME}/.local}

SCRIPT_DIR=$(readlink -f $(dirname $0))
PROJECT_DIR=${SCRIPT_DIR}/$(basename $0 .sh)

if [[ $1 = compile ]]; then
  exit 0
fi

if [[ $1 = install ]]; then
  set -x
  ln -s ${PROJECT_DIR}/c ${PREFIX}/bin/c
  set +x
  exit 0
fi

if [[ $1 = uninstall ]]; then
  exit 0
fi
