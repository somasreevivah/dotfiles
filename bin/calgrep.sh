#! /usr/bin/env bash

apts=${HOME}/.calcurse/apts

grep --color=always -i -E $@ ${apts}
