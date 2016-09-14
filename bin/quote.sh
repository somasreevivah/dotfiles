#! /usr/bin/env bash

QUOTE_PATH=${HOME}/.dotfiles/docs/quotes.txt

NQUOTES=$(wc -l ${QUOTE_PATH} | cut -d " " -f1)

quote_number=$( for (( i = 1; i < ${NQUOTES}; i++ )); do echo ${i}; done | shuf | head -1)

sed -n ${quote_number}p ${QUOTE_PATH}

#vim-run: bash %

