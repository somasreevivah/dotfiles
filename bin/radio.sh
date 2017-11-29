#! /usr/bin/env bash

search=$1

url="https://www.internet-radio.com/search/?radio=${search}"

tmpfile=$(mktemp)

echo "Writing in ${tmpfile}"

curl -s "${url}" |
grep "Play in new window" |
sed "s/<a.*mount=//" |
sed "s/website.*//" |
sed "s/&amp;//g" |
grep pls |
sed "s/^\s*//" |
awk -F ".pls.*title=" '{print $2, $1".pls"}' > ${tmpfile}

cat -n ${tmpfile}

read -p "Select number: " number

play_url=$(
  sed -n "${number}p" ${tmpfile} | sed 's/.*http/http/'
)

mplayer -playlist ${play_url}

#vim-run: bash % israel | less
