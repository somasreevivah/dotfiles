#! /usr/bin/env bash


search_string=
for term in $@
do
  search_string="$search_string%20$term"
done


###########################
#  From bibtexsearch.com  #
###########################

curl -s "http://search.bibtexsearch.com/search?auth=web&q=$search_string" | \
  jq  ".[] | ._source.bibtex" | \
  sed "s/\\\t/  /g" | \
  sed "s/\\\n/\n/g" | \
  sed -e "s/\"@/@/g" -e "s/}\"/}/g" 
