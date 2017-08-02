#! /usr/bin/env bash

animal=$(cowsay -l | sed 1d | tr ' ' '\n' | sort -R | sed -n 1p)
echo ${animal}

fortune | cowsay -f ${animal}
