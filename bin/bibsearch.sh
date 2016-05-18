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


################
#  From arxiv  #
################


curl -s http://export.arxiv.org/api/query?search_query=all:$search_string | \
  grep pdf | \
  sed -E "s/.*\/pdf\/(\S+)\".*/\1/" | \
  while read i ; do 
    curl -s https://arxiv2bibtex.org/?q=$i&format=bibtex ; 
  done | \
    sed -n -e "/@.*{/,/}<\/textarea>/ p" | \
    sed -e "s/<\/textarea>//"
