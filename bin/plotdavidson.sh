#! /usr/bin/env bash

input="1 10 20 30"
input=`echo {1..10}`

awk_ifline=$(echo $input | sed "s/ / || \$2 == /g; s/^/\$2 == /g;")
echo ${awk_ifline}


grep Davidson cc4s.log |
sed "/It\|Writi\|=/Id" |
sed "s/.*: //"                   |
sed "s/  */ /g"                  |
awk '{ if ('"$awk_ifline"') print $LF }' |
panplot  d2 \
  --cols 1 4  \
  --xlabel Iterations \
  --ylabel Eneregy  \
  --points \
  --title "Eigenvalue(s) $input"
