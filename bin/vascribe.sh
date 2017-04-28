#! /usr/bin/env bash

folder=$1


INCAR=$(cat ${folder}/INCAR | sed "s/[!#].*//; /^$/d" | column -t -s =)

paste <(echo "$INCAR") <(echo "$INCAR")
