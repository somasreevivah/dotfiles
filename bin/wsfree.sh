#! /usr/bin/env bash


get_href() {
  while read line ; do
    echo $line;
  done \
  | sed 's/href/\nhref/g' \
  | grep href \
  | sed "s/href\s*=\s*\"//" \
  | sed "s/\".*//"
}


SERIE=futurama
SERIE=south_park
BASE_URL=https://watchseriesfree.to
PROVIDER=nowvideo
ISOLATE_2="open/cale"
DATA_FILE=${PROVIDER}_${SERIE}.txt
>${DATA_FILE}

curl -s ${BASE_URL}/serie/${SERIE}/ \
  | get_href \
  | grep html \
  | while read episode; do
    echo ${episode} \
      | tee -a ${DATA_FILE} \
      | xargs -n1 -I {} curl -s ${BASE_URL}/{} \
      | grep ${PROVIDER} \
      | get_href \
      | grep html \
      | uniq \
      | grep ${ISOLATE_2} \
      | head -1 \
      | xargs -n1 -I {} curl -s ${BASE_URL}/{} \
      | grep ${PROVIDER} \
      | get_href \
      | tee -a ${DATA_FILE} \

done


#vim-run: bash %  
